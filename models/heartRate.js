const Sequelize = require('sequelize');

module.exports = function (sequelize) {
    const HeartRate = sequelize.define('heart_rate', {
        respondentID: Sequelize.INTEGER,
        testType: Sequelize.ENUM('light', '3_colors', 'sound', 'math_sound_test', 'math_vis', 'easy_action', 'hard_action', 'analog_tracking_test', 'random_access_memory', 'short_term_memory_test', 'myunsterberg_test', 'compare_test', 'attention_assessment_test', 'abstract_thinking_test', 'abstract_test'),
        heartRateBefore: Sequelize.INTEGER,
        heartRateDuring: Sequelize.JSON,
        heartRateAfter: Sequelize.INTEGER,
        check: Sequelize.BOOLEAN
    });

    return HeartRate;
};
