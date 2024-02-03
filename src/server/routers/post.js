const express = require('express');
const router = express.Router();

const db = require('../../database');
const { checkArgs } = require('../middleware');


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
            title: 'New Post',
            name: global.name,
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
            title: post[0].title,
            name: global.name,
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


module.exports = { handler: router };
