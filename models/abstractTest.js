const Sequelize = require('sequelize')

module.exports = function (sequelize){
    const AbstractTest = sequelize.define('abstract_test', {
        user: Sequelize.INTEGER,
        type: Sequelize.STRING,
        result: Sequelize.FLOAT
    })

    return AbstractTest
}