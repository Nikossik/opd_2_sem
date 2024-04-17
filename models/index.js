const Sequelize = require('sequelize');
const UserModel = require('./user');
const PollModel = require('./poll');
const ProfessionModel = require('./profession');
const ReactionTestModel = require('./reactionTest')
const ComplexReactionTestModel = require('./complexReactionTest')
const InviteLinkModel = require('./inviteLink')
const AccuracyTestModel = require('./accuracyTest')

const sequelize = new Sequelize('opd_2_sem', 'postgres', '', {
    dialect: 'postgres',
    port: 5432,
    host: 'localhost',
});

const User = UserModel(sequelize);
const Poll = PollModel(sequelize);
const ReactionTest = ReactionTestModel(sequelize);
const ComplexReactionTest = ComplexReactionTestModel(sequelize);
const InviteLink = InviteLinkModel(sequelize);
const AccuracyTest = AccuracyTestModel(sequelize);
const Profession = ProfessionModel(sequelize)

module.exports = {
    sequelize,
    User,
    Poll,
    Profession,
    ReactionTest,
    ComplexReactionTest,
    InviteLink,
    AccuracyTest
};
