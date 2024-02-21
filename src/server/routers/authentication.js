const bcrypt = require('bcrypt');
const express = require('express');
const router = express.Router();

const db = require('../../database');


const hashPassword = async (password) => {
    const saltRounds = 10; 
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    return hashedPassword;
};


router.get('/register', (request, response) => {
    let route = request.baseUrl + '/register';
    let message = null;
    const redirect = request.query.redirect || null;
    if (redirect) {
        route += `?redirect=${redirect}`;
        message = {
            type: 'info',
            text: 'You Must be Logged-In to View that Page!'
        };
    };

    if (request.session.user) {
        return response.redirect(request.baseUrl);
    };

    response.render('authentication', {
        title: 'Register',
        name: global.name,
        session: null,
        type: 'Register',
        route: route,
        message: message
    });
});

router.post('/register', async (request, response) => {
    const redirect = request.query.redirect || null;

    if (request.session.user) {
        return response.redirect(request.baseUrl);
    };

    const { username, password } = request.body;
    const hashedPassword = await hashPassword(password);

    try {
        const [check] = await db.execute('SELECT * FROM users WHERE username = ?', [username]);
        if (check && check.length > 0) {
            return response.render(
                'authentication', {
                    title: 'Register',
                    name: global.name,
                    session: null,
                    type: 'Register',
                    route:  request.baseUrl + '/register',
                    message: {
                        type: 'warning',
                        text: 'Username Already Exists!'
                    }
                }
            );
        }

        await db.execute('INSERT INTO users (username, password) VALUES (?, ?)', [username, hashedPassword]);
        const user = await db.query('SELECT * FROM users WHERE username = ?', [username]);

        request.session.user = {
            id: user.id,
            username: user.username
        };
        response.render('authentication', {
            title: 'Register',
            name: global.name,
            session: request.session.user,
            type: 'Register',
            route: redirect || request.baseUrl,
            message: {
                type: 'success',
                text: 'Account Created Successfully! Redirecting to Home Page . . .',
                redirect: request.baseUrl
            }
        });

    } catch (error) {
        console.error('Error at Route -> [POST] /register');
        console.error(error);
        response.sendStatus(500);
    }
});


router.get('/login', (request, response) => {
    let route = request.baseUrl + '/login';
    let message = null;
    const redirect = request.query.redirect || null;
    if (redirect) {
        route += `?redirect=${redirect}`;
        message = {
            type: 'info',
            text: 'You Must be Logged-In to View that Page!'
        };
    };

    if (request.session.user) {
        return response.redirect(request.baseUrl);
    };

    response.render('authentication', {
        title: 'Login',
        name: global.name,
        session: null,
        type: 'Login',
        route: route,
        message: message
    });
});

router.post('/login', async (request, response) => {
    const redirect = request.query.redirect || null;

    if (request.session.user) {
        return response.redirect(request.baseUrl);
    };

    const { username, password } = request.body;

    try {
        const [data] = await db.execute('SELECT * FROM users WHERE username = ?', [username]);

        if (!data || data.length === 0) {
            return response.render('authentication', {
                title: 'Login',
                name: global.name,
                session: null,
                type: 'Login',
                route: request.baseUrl + '/login',
                message: {
                    type: 'danger',
                    text: 'Invalid Username'
                }
            });
        }
        const user = data[0];
        
        const match = await bcrypt.compare(password, user.password);
        if (match) {
            request.session.user = {
                id: user.id,
                username: user.username
            };
            return response.render('authentication', {
                title: 'Login',
                name: global.name,
                session: request.session.user,
                type: 'Login',
                route: request.baseUrl + (redirect || ''),
                message: {
                    type: 'success',
                    text: 'Login Successful! Redirecting . . .',
                    redirect: request.baseUrl + (redirect || '')
                }
            });
        } else {
            return response.render('authentication', {
                title: 'Login',
                name: global.name,
                session: null,
                type: 'Login',
                route: request.baseUrl + '/login',
                message: {
                    type: 'danger',
                    text: 'Invalid Password'
                }
            });
        }
    } catch (error) {
        console.error('Error at Route -> [POST] /login');
        console.error(error);
        response.sendStatus(500);
    }
});


router.get('/logout', (request, response) => {
    if (request.session.user) {
        request.session.destroy();
    };

    response.redirect(request.baseUrl);
});


module.exports = router;
