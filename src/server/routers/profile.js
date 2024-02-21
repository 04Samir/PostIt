const express = require('express');
const router = express.Router();
const db = require('../../database');


router.get('/users/:username', async (request, response) => {
    const username = request.params.username;

    try {
        const [user] = await db.execute('SELECT * FROM users WHERE username = ?', [username]);

        if (!user || user.length === 0) {
            response.sendStatus(404);
            return;
        };

        const [joinedTopics] = await db.execute('SELECT * FROM user_topic INNER JOIN topics ON user_topic.topic_id = topics.id WHERE user_topic.user_id = ?', [user[0].id]);
        const [userPosts] = await db.execute('SELECT * FROM posts WHERE user_id = ?', [user[0].id]);
        const [userComments] = await db.execute('SELECT * FROM comments INNER JOIN posts ON comments.post_id = posts.id WHERE comments.user_id = ?', [user[0].id]);

        response.render('profile', {
            title: `${user[0].username}'s Profile`,
            name: global.name,
            session: request.session.user, 
            user: user[0],
            joinedTopics,
            userPosts,
            userComments
        });
    } catch (error) {
        console.error('Error at Route -> GET /users/:username');
        console.error(error);
        response.sendStatus(500);
    }
});


module.exports = router;
