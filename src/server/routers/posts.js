const express = require('express');
const router = express.Router();

const db = require('../../database');


router.get('/posts', async (request, response) => {
    try {
        const [posts] = await db.execute(
            'SELECT * FROM posts INNER JOIN users ON posts.user_id = users.id ORDER BY posts.created_at DESC'
        );

        response.render('posts', { title: 'All Posts', name: global.name, session: request.session.user, posts });

    } catch (error) {
        console.error('Error at Route -> [GET] /posts');
        console.error(error);
        response.sendStatus(500);
    }
});


module.exports = { handler: router };
