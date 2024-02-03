const fs = require('fs');
const path = require('path');

const routes = __dirname + '/routers';
const routers = [];

fs.readdirSync(routes)
    .forEach(file => {
        routers.push(require(path.join(routes, file)));
    });


module.exports = routers;
