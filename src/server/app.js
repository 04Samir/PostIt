const ejs = require('ejs');
const express = require('express');
const session = require('express-session');

const routes = require('./routes');


const app = express();
const baseURl = '/postit';

app.use(session({
    secret: 'PostIt',
    resave: true,
    saveUninitialized: true,
}));

app.set('view engine', 'ejs');
app.set('views', 'src/assets/views');
app.engine('html', ejs.renderFile);
app.use(express.static('src/assets/public'));

app.use('/css', express.static('node_modules/bootstrap/dist/css'));
app.use('/js', express.static('node_modules/bootstrap/dist/js'));
app.use('/js', express.static('node_modules/jquery/dist'));
app.use('/js', express.static('node_modules/jquery-ui/dist'));

app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.use((req, res, next) => {
    res.locals.baseUrl = baseURl;
    next();
});

global.name = "PostIt";
routes.forEach((route) => {
    app.use(baseURl, route);
});


module.exports = app;
