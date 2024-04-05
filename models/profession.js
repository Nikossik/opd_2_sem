const Sequelize = require('sequelize')

module.exports = function (sequelize){
    const Profession = sequelize.define('profession',{
        profession: Sequelize.STRING,
        competition: Sequelize.ENUM('Низкая', 'Средняя', 'Высокая'),
        salary: {
            type: Sequelize.STRING,
            validate: {
                isWithinRange(value) {
                    const [min, max] = value.split('-').map(Number);
                    if (min < 60 || max > 500 || min >= max) {
                        throw new Error('Зарплата должна быть в диапазоне от 60 до 500');
                    }
                }
            }
        },
        study: Sequelize.ENUM('Низкая', 'Средняя', 'Высокая'),
        description: Sequelize.TEXT,
        task: Sequelize.TEXT
    })

    return Profession;
}