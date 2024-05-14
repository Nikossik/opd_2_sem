const Sequelize = require('sequelize')

module.exports = function (sequelize){
    const ReactionTest = sequelize.define('abstract_test', {
        user: Sequelize.INTEGER,
        type: Sequelize.STRING,
        result: Sequelize.FLOAT
    })

    return ReactionTest
}