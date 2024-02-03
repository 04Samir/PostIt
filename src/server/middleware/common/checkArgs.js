const db = require('../../../database');


const checkArgs = async (request, response, next) => {
    const topicArg = request.params.topicArg;

    let key = 'name';
    let redirect = false;
    if (!isNaN(topicArg)) {
        key = 'id';
        redirect = true;
    };

    try {
        const sql = 'SELECT * FROM topics WHERE ?? = ?';
        const formattedSql = db.format(sql, [key, topicArg]);
        const [topic] = await db.execute(formattedSql);
        
        if (!topic || topic.length === 0) {
            response.sendStatus(404);
            return;
        };

        if (redirect) {
            return response.redirect(`/topics/${topic[0].name}`);
        } else {
            next();
        };
    } catch (error) {
        console.error(`Error at Route -> [${request.method}] ${request.originalUrl}`);
        console.error(error);
        response.sendStatus(500);
    };
};


module.exports = checkArgs;
