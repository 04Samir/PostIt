const express = require('express');
const router = express.Router();

const db = require('../../database');


router.get('/topics', async (request, response) => {
    try {
        const [topics] = await db.execute('SELECT * FROM topics ORDER BY name ASC');

        response.render('topics', { title: 'All Topics', name: global.name, session: request.session.user, topics });

    } catch (error) {
        console.error('Error at Route -> [GET] /topics');
        console.error(error);
        response.sendStatus(500);
    }
});



module.exports = router;
