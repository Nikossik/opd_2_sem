const { getHashes } = require('crypto')
const {Poll, ReactionTest, ComplexReactionTest, User, AccuracyTest, Profession, HeartRate, StatisticAll, AbstractTest} = require('../models')

async function filterTest(type, username, testId, testType){
    let userId = null

    if (username){
        const user = await User.findOne({
            where: {
                login: username
            }
        })

        userId = user.id
    }

    if (type === "characteristicsTest"){
        if (testId){
            return await Poll.findByPk(testId)
        }

        if (userId){
            return await Poll.findAll(
                {
                    where: {
                        user: userId
                    }
                }
            )
        } else {
            return await Poll.findAll()
        }

    } else if (type === "reactionTest"){
        if (testId){
            return await ReactionTest.findByPk(testId)
        }

        let filters = {}

        if(testType){
            filters["type"] = testType
        }

        if (userId){
            filters["user"] = userId
        }

        if (filters){
            return await ReactionTest.findAll({
                where : filters
            })
        } else {
            return await ReactionTest.findAll()
        }
    } else if(type === "complexReactionTest") {
        if (testId){
            return await ComplexReactionTest.findByPk(testId)
        }

        let filters = {}

        if (userId){
            filters["user"] = userId
        }

        if(testType){
            filters["type"] = testType
        }

        if (filters){
            return await ComplexReactionTest.findAll({
                where : filters
            })
        } else {
            return await ComplexReactionTest.findAll()
        }
    } else if(type === "accuracyTest") {
        if (testId){
            return await AccuracyTest.findByPk(testId)
        }

        let filters = {}

        if (userId){
            filters["user"] = userId
        }

        if(testType){
            filters["type"] = testType
        }

        if (filters){
            return await AccuracyTest.findAll({
                where : filters
            })
        } else {
            return await AccuracyTest.findAll()
        }
    } else if(type === "abstractionTest") {
        if (testId){
            return await AbstractTest.findByPk(testId)
        }

        let filters = {}

        if (userId){
            filters["user"] = userId
        }

        if(testType){
            filters["type"] = testType
        }

        if (filters){
            return await AbstractTest.findAll({
                where : filters
            })
        } else {
            return await AbstractTest.findAll()
        }
    }
}

async function getUsers(){
    const users = await User.findAll()
    let logins = []

    if(users) {
        users.forEach(user => {
            logins.push(user.id)
        })
    }

    return logins
}
async function getAdmins(){
    const admins = await User.findAll({
        where: {
            isAdmin: true
        },
        attributes: ['id', 'login'] 
    });

    return admins.map(admin => {
        return { id: admin.id, login: admin.login };
    });
}


async function getExpertPolls(userId) {
    const polls = await Poll.findAll({
        where: {
            user: userId
        }
    });
    return polls; 
}

async function getProfessionCharacteristics(professionId) {
    try {
        const characteristics = await Profession.findAll({
            where: {
                id: professionId
            }
        });
        return characteristics;
    } catch (err) {
        console.error('Ошибка при получении характеристик профессии из базы данных', err);
        throw err;
    }
}

async function getHeartCheck(heartRateBefore, heartRateDuringValues, heartRateAfter) {
    /* if (heartRateBefore >= heartRateAfter) {
        return true;
    } else {
        return false;
    } */
    const lowerLimit = 60;
    const upperLimit = 100;

    if (heartRateBefore < lowerLimit || heartRateBefore > upperLimit) {
        return false;
    }

    for (let heartRateDuring of heartRateDuringValues) {
        if (heartRateDuring < lowerLimit || heartRateDuring > upperLimit) {
            return false;
        }
    }

    if (heartRateAfter < lowerLimit || heartRateAfter > upperLimit) {
        return false;
    }

    return true;
}

async function getResultNumberTest(user, testType, type) {
    try {
        let result;

        if (testType === 'complex_reaction') {
            result = await ComplexReactionTest.min('reactionTime1', {
                where: {
                    user: user,
                    type: type
                }
            });
        } else if (testType === 'accuracy') {
            result = await AccuracyTest.max('accuracy', {
                where: {
                    user: user,
                    type: type
                }
            });
        } else if (testType === 'reaction') {
            result = await ReactionTest.min('reactionTime', {
                where: {
                    user: user,
                    type: type
                }
            });
        } else if (testType === 'abstract_test') {
            result = await AbstractTest.max('result', {
                where: {
                    user: user,
                    type: type
                }
            });
        } else {
            throw new Error('Invalid test type');
        }

        return result;
    } catch (error) {
        console.error('Error executing query:', error);
        throw error;
    }
}

async function getHeartRateCheck(user, type) {
    try {
        const check = await HeartRate.findOne({
            where: {
                respondentID: user,
                testType: type
            }
        });
        return check;
    } catch (err) {
        console.error('Ошибка при получении данных о пульсе', err);
        throw err;
    }
}

// HERE IS YOUR CODE

module.exports = {filterTest, getUsers, getAdmins, getExpertPolls, getProfessionCharacteristics, getHeartCheck, getResultNumberTest, getHeartRateCheck}