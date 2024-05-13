const Sequelize = require('sequelize');

module.exports = function (sequelize) {
    const HeartRate = sequelize.define('statistics_all', {
        user: Sequelize.INTEGER,
        type: Sequelize.STRING,
        result: Sequelize.FLOAT,
        heartRateCheck: Sequelize.BOOLEAN
    });

    return HeartRate;
};