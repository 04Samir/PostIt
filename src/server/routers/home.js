const express = require('express');
const router = express.Router();

const db = require('../../database');


router.get('/', async (request, response) => {
    try {
        const [topics] = await db.execute(
            'SELECT topics.*, COUNT(posts.id) AS post_count FROM topics LEFT JOIN posts ON topics.id = posts.topic_id GROUP BY topics.id ORDER BY post_count DESC LIMIT 10'
        );
        const [posts] = await db.execute(
            'SELECT posts.*, topics.name AS topic_name FROM posts INNER JOIN topics ON posts.topic_id = topics.id ORDER BY posts.created_at DESC LIMIT 10'
        );
        const [users] = await db.execute('SELECT * FROM users ORDER BY created_at DESC LIMIT 10');

        response.render('home', { title: 'Home', name: global.name, session: request.session.user, topics, posts, users });

    } catch (error) {
        console.error('Error at Route -> [GET] /');
        console.error(error);
        response.sendStatus(500);
    }
});


module.exports = { handler: router };
