const express = require('express');
const router = express.Router();

const db = require('../../database');


router.get('/search', async (request, response) => {
    const query = request.query.q;

    try {
        const [topicsResults] = await db.execute('SELECT * FROM topics WHERE name LIKE ?', [`%${query}%`]);
        const [postsResults] = await db.execute('SELECT * FROM posts WHERE title LIKE ? OR content LIKE ?', [`%${query}%`, `%${query}%`]);

        response.format({
            html: () => {
                response.type('html');
                response.render('search', { title: global.name, session: request.session.user, query, topics: topicsResults, posts: postsResults });
            },
            json: () => {
                response.type('json');
                response.json({
                    topics: topicsResults.map(topic => ({ label: topic.name, category: 'topics', url: `/topics/${topic.name}` })),
                    posts: postsResults.map(post => ({ label: post.title, category: 'posts', url: `/posts/${post.id}` }))
                });
            },
            default: () => {
                response.status(406);
                response.type('text/plain');
                response.send('Not Supported');
            }
        });

    } catch (error) {
        console.error('Error at Route -> [GET] /search');
        console.error(error);
        response.sendStatus(500);
    }
});



module.exports = { handler: router };
