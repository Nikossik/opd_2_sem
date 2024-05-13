const Sequelize = require('sequelize');

module.exports = function (sequelize) {
    const HeartRate = sequelize.define('heart_rate', {
        respondentID: Sequelize.INTEGER,
        testType: Sequelize.ENUM('3_colors', 'light', '3_colors', 'sound', 'math_sound_test', 'math_vis', 'easy_action', 'hard_action', 'analog_tracking_test', 'analog_tracking_test'),
        heartRateBefore: Sequelize.INTEGER,
        heartRateDuring: Sequelize.INTEGER,
        heartRateAfter: Sequelize.INTEGER,
        check: Sequelize.BOOLEAN
    });

    return HeartRate;
};
