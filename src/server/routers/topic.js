const express = require('express');
const router = express.Router();

const db = require('../../database');
const { checkArgs } = require('../middleware');


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
            title: topic[0].name,
            name: global.name,
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
            response.redirect(`${request.baseUrl}/login?redirect=/topics/${topic[0].name}`);
            return;
        };

        const [data] = await db.execute('SELECT * FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);
        if (data && data.length > 0) {
            response.redirect(`/topics/${topic[0].name}`);
            return;
        } else {
            await db.execute('INSERT INTO user_topic (user_id, topic_id) VALUES (?, ?)', [request.session.user.id, topic[0].id]);
        };

        response.redirect(`${request.baseUrl}/topics/${topic[0].name}`);

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
            response.redirect(`${request.baseUrl}/login?redirect=/topics/${topic[0].name}`);
            return;
        };

        await db.execute('DELETE FROM user_topic WHERE user_id = ? AND topic_id = ?', [request.session.user.id, topic[0].id]);

        response.redirect(`${request.baseUrl}/topics/${topic[0].name}`);

    }
    catch (error) {
        console.error('Error at Route -> [GET] /topics/:topicArg/join');
        console.error(error);
        response.sendStatus(500);
    }
});


module.exports = router;
