const express = require('express');
const router = express.Router();

const db = require('../../database');


const checkArgs = async (request, response, next) => {
    const topicArg = request.params.topicArg;

    let key = 'name';
    let redirect = false;
    if (!isNaN(topicArg)) {
        key = 'id';
        redirect = true;
    };

    try {
        const sql = 'SELECT * FROM topics WHERE ?? = ?';
        const formattedSql = db.format(sql, [key, topicArg]);
        const [topic] = await db.execute(formattedSql);
        
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (redirect) {
            return response.redirect(`/topics/${topic[0].name}`);
        } else {
            next();
        };
    } catch (error) {
        console.error(`Error at Route -> [${request.method}] ${request.originalUrl}`);
        console.error(error);
        response.sendStatus(500);
    };
};


router.get('/topics/:topicArg', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [posts] = await db.execute(
            'SELECT posts.*, users.username AS user_username FROM posts JOIN users ON posts.user_id = users.id WHERE posts.topic_id = ? ORDER BY posts.created_at DESC',
            [topic[0].id]
        );
        const [users] = await db.execute(
            'SELECT * FROM user_topic INNER JOIN users ON user_topic.user_id = users.id WHERE user_topic.topic_id = ? LIMIT 25',
            [topic[0].id]
        );
        
        let joined = false;
        if (request.session.user) {
            const [check] = await db.execute('SELECT * FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user?.id, topic[0].id]);
            if (check && check.length > 0) {
                joined = true;
            };
        };

        response.render('topic', {
            title: global.name,
            session: request.session.user,
            topic: topic[0],
            posts,
            users,
            joined: joined
        });

    } catch (error) {
        console.error('Error at Route -> [GET] /topics/:topicArg');
        console.error(error);
        response.sendStatus(500);
    }
});


router.post('/topics/:topicArg/join', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}`);
            return;
        };

        const [data] = await db.execute('SELECT * FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);
        if (data && data.length > 0) {
            response.redirect(`/topics/${topic[0].name}`);
            return;
        } else {
            await db.execute('INSERT INTO user_topic (user_id, topic_id) VALUES (?, ?)', [request.session.user.id, topic[0].id]);
        };

        response.redirect(`/topics/${topic[0].name}`);

    }
    catch (error) {
        console.error('Error at Route -> [GET] /topics/:topicArg/join');
        console.error(error);
        response.sendStatus(500);
    }
});

router.post('/topics/:topicArg/leave', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}`);
            return;
        };

        await db.execute('DELETE FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);

        response.redirect(`/topics/${topic[0].name}`);

    }
    catch (error) {
        console.error('Error at Route -> [GET] /topics/:topicArg/join');
        console.error(error);
        response.sendStatus(500);
    }
});


router.get('/topics/:topicArg/posts/new', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}/posts`);
            return;
        };

        let message = null;
        const [check] = await db.execute('SELECT * FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);
        if (!check || check.length === 0) {
            message = {
                type: 'warning',
                text: 'You are Not a Member of this Topic. Redirecting to Topic Page . . .',
                redirect: `/topics/${topic[0].name}`
            };
        };

        response.render('new-post', {
            title: global.name,
            session: request.session.user,
            topic: topic[0],
            message
        });

    } catch (error) {
        console.error('Error at Route -> [GET] /topics/:topicArg/posts/new');
        console.error(error);
        response.sendStatus(500);
    }
});

router.post('/topics/:topicArg/posts/new', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}/posts/new`);
            return;
        };

        const [check] = await db.execute('SELECT * FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);
        if (!check || check.length === 0) {
            response.redirect(`/topics/${topic[0].name}/posts/new`);
            return;
        };

        const { title, content } = request.body;
        if (!title || !content) {
            response.redirect(`/topics/${topic[0].name}/posts/new`);
            return;
        };

        const [post] = await db.execute('INSERT INTO posts (title, content, user_id, topic_id) VALUES (?, ?, ?, ?)', [title, content, request.session.user.id, topic[0].id]);

        response.redirect(`/topics/${topic[0].name}/posts/${post.insertId}`);
    }
    catch (error) {
        console.error('Error at Route -> [POST] /topics/:topicArg/posts/new');
        console.error(error);
        response.sendStatus(500);
    }
});


router.post('/topics/:topicArg/posts/:postId/delete', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;
    const postId = request.params.postId;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [post] = await db.execute('SELECT * FROM posts WHERE id = ? AND user_id = ?', [postId, request.session.user.id]);
        if (!post || post.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        await db.execute('DELETE FROM posts WHERE id = ?', [post[0].id]);

        response.redirect(`/topics/${topic[0].name}`);
    }
    catch (error) {
        console.error('Error at Route -> [DELETE] /topics/:topicArg/posts/:postId/delete');
        console.error(error);
        response.sendStatus(500);
    }
});


router.get('/topics/:topicArg/posts/:postId', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;
    const postId = request.params.postId;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [post] = await db.execute('SELECT posts.*, users.username AS user_username FROM posts JOIN users ON posts.user_id = users.id WHERE posts.id = ?', [postId]);
        if (!post || post.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [comments] = await db.execute(
            'SELECT comments.*, users.username AS user_username FROM comments JOIN users ON comments.user_id = users.id WHERE comments.post_id = ? ORDER BY comments.created_at DESC',
            [postId]
        );

        response.render('post', {
            title: global.name,
            session: request.session.user,
            topic: topic[0],
            post: post[0],
            comments
        });

    } catch (error) {
        console.error('Error at Route -> [GET] /topics/:topicArg/posts/:postId');
        console.error(error);
        response.sendStatus(500);
    }
});


router.post('/topics/:topicArg/posts/:postId/comments', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;
    const postId = request.params.postId;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [post] = await db.execute('SELECT * FROM posts WHERE id = ?', [postId]);
        if (!post || post.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        const [check] = await db.execute('SELECT * FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);
        if (!check || check.length === 0) {
            response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        const { content } = request.body;
        if (!content) {
            response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        await db.execute('INSERT INTO comments (content, user_id, post_id) VALUES (?, ?, ?)', [content, request.session.user.id, post[0].id]);

        response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
    }
    catch (error) {
        console.error('Error at Route -> [POST] /topics/:topicArg/posts/:postId/comments/new');
        console.error(error);
        response.sendStatus(500);
    }
});

router.get('/topics/:topicArg/posts/:postId/comments/:commentId/reply', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;
    const postId = request.params.postId;
    const commentId = request.params.commentId;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [post] = await db.execute('SELECT * FROM posts WHERE id = ?', [postId]);
        if (!post || post.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [comment] = await db.execute('SELECT * FROM comments WHERE id = ?', [commentId]);
        if (!comment || comment.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        const [check] = await db.execute('SELECT * FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);
        if (!check || check.length === 0) {
            response.render('new-reply', {
                title: global.name,
                session: request.session.user,
                topic: topic[0],
                post: post[0],
                comment: comment[0],
                message: {
                    type: 'warning',
                    text: 'You are Not a Member of this Topic. Redirecting to Topic Page . . .',
                    redirect: `/topics/${topic[0].name}`
                }
            });
        };

        response.render('new-reply', {
            title: global.name,
            session: request.session.user,
            topic: topic[0],
            post: post[0],
            comment: comment[0]
        });
    }
    catch (error) {
        console.error('Error at Route -> [GET] /topics/:topicArg/posts/:postId/comments/:commentId/reply');
        console.error(error);
        response.sendStatus(500);
    }
});

router.post('/topics/:topicArg/posts/:postId/comments/:commentId/reply', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;
    const postId = request.params.postId;
    const commentId = request.params.commentId;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [post] = await db.execute('SELECT * FROM posts WHERE id = ?', [postId]);
        if (!post || post.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        const [check] = await db.execute('SELECT * FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);
        if (!check || check.length === 0) {
            response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        const { content } = request.body;
        if (!content) {
            response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        await db.execute('INSERT INTO comments (content, user_id, post_id, parent_id) VALUES (?, ?, ?, ?)', [content, request.session.user.id, post[0].id, commentId]);

        response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
    }
    catch (error) {
        console.error('Error at Route -> [POST] /topics/:topicArg/posts/:postId/comments/:commentId/reply');
        console.error(error);
        response.sendStatus(500);
    }
});


router.post('/topics/:topicArg/posts/:postId/comments/delete', checkArgs, async (request, response) => {
    const topicArg = request.params.topicArg;
    const postId = request.params.postId;

    try {
        const [topic] = await db.execute('SELECT * FROM topics WHERE name = ?', [topicArg]);
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [post] = await db.execute('SELECT * FROM posts WHERE id = ?', [postId]);
        if (!post || post.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (!request.session.user) {
            response.status(401)
            response.redirect(`/login?redirect=/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        const { commentId } = request.body;
        if (!commentId) {
            response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        const [comment] = await db.execute('SELECT * FROM comments WHERE id = ? AND user_id = ?', [commentId, request.session.user.id]);
        if (!comment || comment.length === 0) {
            response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
            return;
        };

        await db.execute('DELETE FROM comments WHERE id = ? OR parent_id = ?', [comment[0].id, comment[0].id]);
        
        response.redirect(`/topics/${topic[0].name}/posts/${post[0].id}`);
    }
    catch (error) {
        console.error('Error at Route -> [DELETE] /topics/:topicArg/posts/:postId/comments');
        console.error(error);
        response.sendStatus(500);
    }
});


module.exports = { handler: router };
