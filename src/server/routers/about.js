const express = require('express');
const router = express.Router();

const db = require('../../database');


router.get('/about', async (request, response) => {
    response.render('about', { title: 'About', name: global.name , session: request.session.user }) ;
});


module.exports = router;
