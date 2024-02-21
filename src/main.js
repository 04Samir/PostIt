require('dotenv').config();
const app = require('./server/app');
const db = require('./database');

const PORT = process.env.PORT || 3000;


const initDatabase = async () => {
    try {
        const connection = await db.getConnection();
        connection.release();
        console.debug('Database Connected!');
    } catch (error) {
        console.error('Error Connecting to Database');
        console.error(error);
    }
};

const startServer = async () => {
    console.clear();
    await initDatabase();

    app.listen(PORT, () => {
        console.debug(`Server Started -> http://localhost:${PORT}`);
    });
};

startServer();
