const Sequelize = require('sequelize');

module.exports = function (sequelize) {
    const HeartRate = sequelize.define('heart_rate', {
        respondentID: Sequelize.INTEGER,
        testType: Sequelize.ENUM('ColorReactionTest', 'LightReactionTest', 'MultipleReactionTest', 'SoundReactionTest', 'SoundMathTest', 'VisualMathTest', 'EasyActionTest', 'HardActionTest', 'AnalogTrackingTest', 'StalkingTest', 'AbstractTest', 'AbstractThinkingTest', 'AttentionAssessmentTest', 'ComprasionMindTest', 'MyunsterbergTest', 'RandomAccessMemoryTest', 'Short-termMemoryTest'),
        heartRateBefore: Sequelize.INTEGER,
        heartRateDuring: Sequelize.INTEGER,
        heartRateAfter: Sequelize.INTEGER
    });

    return HeartRate;
};
