const fs = require('fs');
const path = require('path');

const routesDir = path.join(__dirname, 'routers');
const routers = [];

fs.readdirSync(routesDir)
    .forEach(file => {
        const router = require(path.join(routesDir, file));
        routers.push(router);
    });

module.exports = routers;
