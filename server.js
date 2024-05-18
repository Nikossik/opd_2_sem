const express = require('express');
const session = require('express-session');
const passport = require('passport');
const flash = require('connect-flash')
const path = require('path')
const crypto = require('crypto')
const LocalStrategy = require('passport-local').Strategy;
const {Profession, sequelize, User, Poll, ReactionTest, HeartRate, StatisticAll, AbstractTest} = require('./models/index');
const {ComplexReactionTest, InviteLink, AccuracyTest} = require("./models");
const {
    filterTest,
    getUsers,
    getAdmins,
    getExpertPolls,
    getProfessionCharacteristics,
    getHeartCheck,
    getResultNumberTest,
    getHeartRateCheck
} = require('./js-scripts/databaseManipulations')
const {login} = require("passport/lib/http/request");
const server = express();
const char_dict = {
    0: 'Стремление к профессиональному совершенству',
    1: 'Адекватная самооценка',
    2: 'Самостоятельность',
    3: 'Пунктуальность',
    4: 'педантичность',
    5: 'Дисциплинированность',
    6: 'Аккуратность в работе',
    7: 'Организованность',
    8: 'Самодисциплинированность',
    9: 'Старательность',
    10: 'Исполнительность',
    11: 'Ответственность',
    12: 'Трудолюбие',
    13: 'Инициативность',
    14: 'Самокритичность',
    15: 'Оптимистичность',
    16: 'Самообладание',
    17: 'способность к самонаблюдению',
    18: 'Предусмотрительность',
    19: 'Фрустрационная толерантность',
    20: 'Самомобилизация',
    21: 'Интернальность',
    22: 'Экстернальность',
    23: 'Интрапунитивность',
    24: 'Экстрапунитивность',
    25: 'Способность к планированию своей деятельности',
    26: 'Способность организовывать свою деятельность в условиях большого потока информации и разнообразия поставленных задач',
    27: 'Способность брать на себя ответственность за принимаемые решения и действия',
    28: 'Способность принимать решение в нестандартных ситуациях',
    29: 'Способность рационально действовать в экстремальных ситуациях',
    30: 'Способность эффективно действовать и принимать решения в условиях дефицита времени',
    31: 'Способность переносить неприятные ощущения',
    32: 'Способность аргументировано отстаивать свое мнение',
    33: 'Способность к переключениям с одной деятельности на другую',
    34: 'Способность преодолевать страх',
    35: 'Сильная воля',
    36: 'Порядочность',
    37: 'Честность',
    38: 'Решительность',
    39: 'Смелость',
    40: 'Способность к зрительным представлениям',
    41: 'Способность к пространственному воображению',
    42: 'Способность наглядно представлять себе новое явление, ранее, не встречающееся в опыте, или старое, но в новых условиях',
    43: 'Способность к переводу образа в словесное описание',
    44: 'Способность к воссозданию образа по словесному описанию',
    45: 'Аналитичность  мышления',
    46: 'Синтетичность мышления',
    47: 'Транссонантность мышления',
    48: 'Логичность мышления',
    49: 'Креативность мышления',
    50: 'Оперативность мышления',
    51: 'Предметность мышления',
    52: 'Образность мышления',
    53: 'Абстрактность мышления',
    54: 'Вербальность мышления',
    55: 'Калькулятивность мышления',
    56: 'Зрительная оценка размеров предметов.',
    57: 'Зрительное восприятие расстояний между предметами',
    58: 'Глазомер: линейный, угловой, объемный',
    59: 'Глазомер динамический (способность оценивать направление и скорость',
    60: 'движения предмета)',
    61: 'Способность к различению фигуры (предмета, отметки, сигнала и пр.) на малоконтрастном фоне',
    62: 'Способность различать и опознавать замаскированные объекты.',
    63: 'Способность к восприятию пространственного соотношения предметов.',
    64: 'Точность и оценка направления на источник звука.',
    65: 'Способность узнавать и различать ритмы',
    66: 'Способность восприятия устной речи',
    67: 'Различение отрезков времени',
    68: 'Способность к распознаванию небольших отклонений параметров технологических процессов от заданных значений по визуальным признакам',
    69: 'Способность к распознаванию небольших отклонений параметров технологических процессов от заданных значений по акустическим признакам',
    70: 'Способность к распознаванию небольших отклонений параметров технологических процессов от заданных значений по кинестетическим признакам',
    71: 'Зрительная долговременная память на лица',
    72: 'Зрительная долговременная память на образы предметного мира',
    73: 'Зрительная долговременная память на условные обозначения',
    74: 'Зрительная долговременная память на цифры и даты',
    75: 'Зрительная долговременная память на слова и фразы',
    76: 'Зрительная долговременная память на семантику текста',
    77: 'Зрительная оперативная память на лица',
    78: 'Зрительная оперативная память на образы предметного мира',
    79: 'Зрительная оперативная память на условные обозначения',
    80: 'Зрительная оперативная память на цифры и даты',
    81: 'Зрительная оперативная память на слова и фразы',
    82: 'Зрительная оперативная память на семантику текста',
    83: 'Слуховая долговременная память на лица',
    84: 'Слуховая долговременная память на образы предметного мира',
    85: 'Слуховая долговременная память на условные обозначения',
    86: 'Слуховая долговременная память на цифры и даты',
    87: 'Слуховая долговременная память на слова и фразы',
    88: 'Слуховая долговременная память на семантику текста',
    89: 'Слуховая оперативная память на цифры и даты',
    90: 'Слуховая оперативная память на семантику текста',
    91: 'Моторная память на простые движения',
    92: 'Моторная память на сложные движения',
    93: 'Моторная память на положение и перемещение тела в пространстве',
    94: 'Тактильная память',
    95: 'Обонятельная память',
    96: 'Вкусовая память',
    97: 'Энергичность, витальность (активность)',
    98: 'Умственная работоспособность',
    99: 'Физическая работоспособность (выносливость)',
    100: 'Нервноэмоциональная устойчивость',
    101: 'Острота зрения',
    102: 'Адаптация зрения к темноте, свету',
    103: 'Контрастная чувствительность монохроматического зрения',
    104: 'Цветовая дифференциальная чувствительность',
    105: 'Устойчивость зрительной чувствительности во времени',
    106: 'Острота слуха',
    107: 'Контрастная чувствительность слуха',
    108: 'Слуховая дифференциальная чувствительность (способность различать: тембр, длительность, высоту, силу звука, ритм, фоновые или разнообразные шумы)',
    109: 'Переносимость длительно действующего звукового раздражителя',
    110: 'Чувствительность (осязание) пальцев',
    111: 'Вибрационная чувствительность',
    112: 'Мышечносуставная чувствительность усилий или сопротивления',
    113: 'Ощущение равновесия',
    114: 'Ощущение ускорения',
    115: 'Обонятельная чувствительность',
    116: 'Способность узнавать и различать вкусовые ощущения',
    117: 'Объем внимания',
    118: 'Концентрированность внимания',
    119: 'Устойчивость внимания во времени',
    120: 'Переключаемость внимания',
    121: 'Способность к распределению внимания между несколькими объектами или видами деятельности',
    122: 'Помехоустойчивость внимания',
    123: 'Способность подмечать изменения в окружающей обстановке, не сосредотачивая сознательно на них внимание',
    124: 'Умение подмечать незначительные (малозаметные) изменения в исследуемом объекте, в показаниях приборов',
    125: 'Способность реагировать на неожиданный зрительный сигнал посредством определённых движений',
    126: 'Способность реагировать на неожиданный слуховой сигнал посредством определённых движений',
    127: 'Согласованность движений с процессами восприятия',
    128: 'Способность к сенсомоторному слежению за движущимся объектом',
    129: 'Способность к выполнению мелких точных движений',
    130: 'Способность к выполнению сложных двигательных действий',
    131: 'Способность к выполнению плавных соразмерных движений',
    132: 'Координация движений ведущей руки',
    133: 'Координация движений обеих рук',
    134: 'Координация движений рук и ног',
    135: 'Координация работы кистей рук и пальцев',
    136: 'Твердость руки, устойчивость кистей рук',
    137: 'Умение быстро записывать',
    138: 'Красивый почерк',
    139: 'Физическая сила.',
    140: 'Способность к быстрой выработке сенсомоторных навыков',
    141: 'Способность к быстрой перестройке сенсомоторных навыков',
    142: 'Пластичность и выразительность движений',
    143: 'Отсутствие дефектов речи, хорошая дикция',
    144: 'Способность речевого аппарата к интенсивной и длительной работе.',
    145: 'Способность к изменению тембра.',
    146: 'Способность к изменению силы звучания',
    147: 'Переносимость динамических физических нагрузок',
    148: 'Переносимость статических физических нагрузок',
    149: 'Быстрый переход из состояния покоя к интенсивной работе',
    150: 'Сохранение работоспособности при недостатке сна',
    151: 'Сохранение работоспособности при развивающемся утомлении',
    152: 'Сохранение бдительности в условиях монотонии',
    153: 'Сохранение бдительности в режиме ожидания',
    154: 'Сохранение работоспособности в некомфортных температурных условиях',
    155: 'Сохранение работоспособности в условиях знакопеременных перегрузок',
    156: 'Сохранение работоспособности в условиях воздействия вибрации',
    157: 'Сохранение работоспособности в условиях воздействия разнонаправленных перегрузок',
    158: 'Сохранение работоспособности в условиях гипо(гипер) барометрических колебаний',
    159: 'Сохранение работоспособности в условиях пониженного парциального давления кислорода',
    160: 'Сохранение работоспособности в условиях пониженного парциального давления углекислого газа',
    161: 'Сохранение работоспособности в условиях ограничения возможностей удовлетворения базовых жизненных потребностей (голод, жажда, отдых, сексуальная потребность)',
    162: 'Сохранение работоспособности в разных природноклиматических условиях',
    163: 'Способность переадаптироваться к новым средовым условиям',
    164: 'Антропометрические характеристики',
    165: 'Особенности телосложения',
    166: 'Хорошее общее физическое развитие',
    167: 'Физическая подготовленность к воздействию неблагоприятных факторов профессиональной деятельности'
};

const testToQualityMap = {
    'sound': [106, 69], // Острота слуха, Способность к распознаванию небольших отклонений параметров технологических процессов по акустическим признакам
    'light': [], // Пока пусто, нужно добавить соответствующие ПВК, если они есть
    'visual_math_test': [101, 68], // Острота зрения, Способность к распознаванию небольших отклонений параметров технологических процессов по визуальным признакам
    'pulse_test': [4, 9, 10, 11], // Нервно-эмоциональная устойчивость, Самообладание, Ответственность
    'hard_action': [121], // Способность к распределению внимания между несколькими объектами или видами деятельности
    'easy_action': [121], // Способность к распределению внимания между несколькими объектами или видами деятельности
    'analog_tracking_test': [118], // Концентрированность внимания
    '3_colors': [101], // Острота зрения
    'math_sound_test': [106], // Острота слуха
    'math_vis': [101], // Острота зрения
    'random_access_memory': [73, 10], // Зрительная долговременная память на условные обозначения, Оперативная память, Кратковременная память
    'short_term_memory_test': [73, 10], // Зрительная долговременная память на условные обозначения, Кратковременная память
    'myunsterberg_test': [98, 121], // Умственная работоспособность, Способность к распределению внимания между несколькими объектами или видами деятельности
    'compare_test': [12, 98, 7, 25, 44, 22], // Трудолюбие, Умственная работоспособность, Способность планировать свою деятельность, Способность к воссозданию образа по словесному описанию, Экстернальность
    'abstract_thinking_test': [45, 48, 42, 52], // Аналитичность мышления, Логичность мышления, Способность наглядно представлять себе новое явление, Образность мышления
    'abstract_test': [49, 42, 48, 52, 44] // Креативность мышления, Способность наглядно представлять себе новое явление, Логичность мышления, Образность мышления, Способность к воссозданию образа по словесному описанию
};

server.use(express.json());
server.use(express.static('front-end'));
server.use('/expert', express.static('front-end/expert'))
server.use(express.static('resources'));
server.use(express.static('public'));
server.use('js-script', express.static('js-scripts'));
server.use(express.urlencoded({extended: true}));
server.use(session({secret: 'my_secret', resave: false, saveUninitialized: false}));
server.use(flash())
server.set('views', path.join(__dirname, 'front-end'))
server.use(express.static(__dirname + '/front-end'));
server.set('view engine', 'ejs')

passport.use('local', new LocalStrategy({usernameField: 'login'}, async (login, password, done) => {
    try {
        const user = await User.findOne({where: {login}});
        if (!user) {
            return done(null, false, {message: 'User does not exist'});
        }
        const isValid = await user.validatePassword(password);

        if (!isValid) {
            console.log("Invalid user")
            return done(null, false, {message: 'Incorrect password.'});
        }

        console.log("User found")

        return done(null, user);
    } catch (err) {
        return done(err);
    }
}));

passport.serializeUser((user, done) => {
    done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
    try {
        const user = await User.findByPk(id);
        if (!user) {
            return done(null, false);
        }
        return done(null, user);
    } catch (err) {
        return done(err);
    }
});

server.use(passport.initialize());
server.use(passport.session());

server.get('/', (req, res) => {
    let username = "", adminUser = false, loggedIn = req.isAuthenticated(), respondentUser = false;
    if (req.isAuthenticated()) {
        username = req.user.login;
        adminUser = req.user.isAdmin;
        respondentUser = req.user.respondent;
    }

    res.render('MenuPageDraft', {username, adminUser, respondentUser, loggedIn})
});


server.get('/login', (req, res) => {
    const errorMessage = req.flash('error')[0]
    res.render('LoginForm', {errorMessage});
});

server.get('/logout', (req, res) => {
    if (req.isAuthenticated()) {
        req.logout(() => {
            res.redirect('/');
        });
    } else {
        res.redirect('/login');
    }
});


server.get('/register', (req, res) => {
    const errorMessage = req.flash('error')[0]
    res.render('RegistrationForm', {errorMessage});
});

server.get('/adminRegister', (req, res) => {
    if (!req.isAuthenticated()) {
        adminUser = false;
        loggedIn = false;
        res.redirect('/login')
        return
    }

    adminUser = req.user.isAdmin;
    loggedIn = true;

    if (!adminUser) {
        res.redirect('/')
    } else {
        const errorMessage = req.flash('error')[0]
        res.render('AdminRegistrationForm', {errorMessage, adminUser, loggedIn});
    }
})

server.get('/light_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('2nd-lab-tests/LightReactionTest')
    }
})
server.get('/colours_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('2nd-lab-tests/ColorReactionTest')
    }
})
server.get('/multiple_colours_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('2nd-lab-tests/MultipleColorReactionTest')
    }
})
server.get('/attention_assessment_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('5th-lab-tests/AttentionAssessmentTest')
    }
})
server.get('/abstract_thinking_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('5th-lab-tests/AbstractThinkingTest')
    }
})
server.get('/myunsterberg_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('5th-lab-tests/MyunsterbergTest')
    }
})
server.get('/abstract_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('5th-lab-tests/AbstractTest')
    }
})
server.get('/sound_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('2nd-lab-tests/SoundReactionTest')
    }
})

server.get('/visual_math_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('2nd-lab-tests/VisualMathTest')
    }
})

server.get('/ram_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('5th-lab-tests/RandomAccessMemoryTest')
    }
})

server.get('/compare_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('5th-lab-tests/ComparisonMindTest')
    }
})

// Рендеринг статической страницы без передачи изображений
server.get('/memory_test', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login');
    } else {
        res.render('5th-lab-tests/Short-termMemoryTest', { images: [], allImages: [] });
    }
});

server.get('/get_images', (req, res) => {
    if (!req.isAuthenticated()) {
        return res.status(401).json({error: 'Not authenticated'});
    }

    const difficulty = req.query.difficulty || 'easy';
    let images, allImages;

    if (difficulty === 'all') {
        // Возвращает все изображения для любого уровня сложности
        allImages = ["img/0.gif", "img/1.gif", "img/2.gif", "img/3.gif", "img/4.gif", "img/5.gif", "img/6.gif", "img/11.gif", "img/19.gif", "img/28.gif", "img/36.gif"];
        return res.json({ images: [], allImages });
    }

    switch(difficulty) {
        case 'easy':
            images = ["img/0.gif", "img/4.gif", "img/5.gif", "img/11.gif"];
            allImages = ["img/0.gif", "img/1.gif", "img/2.gif", "img/3.gif", "img/4.gif", "img/5.gif", "img/6.gif", "img/11.gif", "img/19.gif", "img/28.gif", "img/36.gif"];
            break;
        case 'medium':
            images = ["img/2.gif", "img/3.gif", "img/6.gif", "img/19.gif", "img/28.gif"];
            allImages = ["img/0.gif", "img/1.gif", "img/2.gif", "img/3.gif", "img/4.gif", "img/5.gif", "img/6.gif", "img/11.gif", "img/19.gif", "img/28.gif", "img/36.gif"];
            break;
        case 'hard':
            images = ["img/0.gif", "img/4.gif", "img/6.gif", "img/11.gif", "img/19.gif", "img/28.gif"];
            allImages = ["img/0.gif", "img/1.gif", "img/2.gif", "img/3.gif", "img/4.gif", "img/5.gif", "img/6.gif", "img/11.gif", "img/19.gif", "img/28.gif", "img/36.gif"];
            break;
    }

    res.json({ images, allImages });
});

server.get('/math_sound', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
    } else {
        res.render('2nd-lab-tests/SoundMathTest')
    }
})

server.get('/create_invite', (req, res) => {
    if (!req.isAuthenticated()) {
        username = "";
        adminUser = false;
        loggedIn = false;
        res.redirect('/login')
    } else {

        username = req.user.login;
        adminUser = req.user.isAdmin;
        loggedIn = true;
        res.render('CreateInviteLinkPage')
    }
})

server.get('/tests_list', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }
    res.render('TestListPage', {'loggedIn': req.isAuthenticated(), 'adminUser': req.user.isAdmin})
})

server.post('/get_tests_from_db', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const type = req.body.type
    const testId = req.body.testId
    const username = req.body.username
    const testType = req.body.testType
    const profession = req.body.profession

    const tests = await filterTest(type, username, testId, testType)

    if (tests !== {}) {
        res.send(tests)
    }
})

server.post('/get_users_from_db', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const users = await getUsers()

    if (users !== []) {
        res.send({logins: users})
    }
})

server.get('/easy_action', async (req, res) => {

    res.render('3rd-lab-tests/EasyActionTest')
})

server.get('/hard_action', async (req, res) => {

    res.render('3rd-lab-tests/HardActionTest')
})

server.get('/invite/:code', async (req, res) => {
    const link = await InviteLink.findOne({
        where: {
            code: req.params.code
        }
    })

    const tests = link.tests
    const data = {
        tests: tests,
        i: 1
    }

    console.log(tests)

    if (link) {
        const url = '/' + tests[0] + '?data=' + encodeURIComponent(JSON.stringify(data))
        res.redirect(url)
    }
})

server.get('/analog_tracking_test', (req, res) => {
    res.render('4th-lab-tests/AnalogTrackingTest')
})

server.get('/stalking_test', (req, res) => {
    res.render('4th-lab-tests/StalkingTest')
})

server.post('/login', passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/login',
    failureFlash: true // enable flash messages
}), function (req, res) {
    res.redirect('/');
}, function (req, res, next) {
    req.flash('error', 'Неверно заданы логин или пароль');
    res.redirect('/login');
});


server.post('/register', async (req, res, next) => {

    try {
        if (!req.body.respondent & !req.body.email) {
            const respondent = false;
            const {login, password} = req.body;
            const isAdmin = false;
            const sex = req.body.sex;
            const age = req.body.age;
            const email = null;
            const user = await User.create({login, password, isAdmin, sex, age, respondent, email});
            req.login(user, (err) => {
                if (err) {
                    console.log(err);
                    return next(err);
                }
                return res.redirect('/');
            });
        } else {
            const respondent = req.body.respondent;
            const {login, password} = req.body;
            const isAdmin = false;
            const sex = req.body.sex;
            const age = req.body.age;
            const email = req.body.email;
            const user = await User.create({login, password, isAdmin, sex, age, respondent, email});
            req.login(user, (err) => {
                if (err) {
                    console.log(err);
                    return next(err);
                }
                return res.redirect('/');
            });
        }
    } catch (err) {
        console.log(err);
        req.flash('error', 'Пользователь уже существует')
        res.redirect("/register")
    }
});

server.post('/adminRegister', async (req, res, next) => {
    const {login, password} = req.body;
    const isAdmin = true;
    username = req.user.login;
    adminUser = req.user.isAdmin;
    loggedIn = true;

    const sex = req.body.sex;
    const age = req.body.age;

    try {
        const user = await User.create({login, password, isAdmin, age, sex});
        req.login(user, (err) => {
            if (err) {
                console.log(err);
                return next(err);
            }
            return res.redirect("/");
        });
    } catch (err) {
        req.flash('error', 'Пользователь уже существует')
        res.redirect("/adminRegister")
    }
});

server.get('/poll_1_part_1', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }
    loggedIn = true;

    const checkAdmin = req.user.isAdmin;
    const professions = await Profession.findAll({attributes: ['profession']});
    if (!checkAdmin) {
        res.redirect('/')
    } else {
        res.render('1stTest1stPart', {'professions': professions, 'adminUser': checkAdmin});
    }
})

server.get('/poll_1_part_2', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    if (!req.flash("passed_1_part")[0]) {
        res.redirect('/')
    } else {
        const data = JSON.parse(decodeURIComponent(req.query.data)).pollData;
        console.log({data});
        const profession = data.professions
        let characteristics = []

        for (let i = 0; i < 169; i++) {
            if (data["question" + i]) {
                characteristics.push({id: i, name: data["question" + i]})
            }
        }
        console.log({profession, characteristics});
        res.render('1stTest2ndPart', {profession, characteristics})
    }
})


server.post("/poll_1_part_2", async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect("/login");
        return;
    }
    let data = {};

    if (req.query.data) {
        data = JSON.parse(decodeURIComponent(req.query.data));
    }

    data.pollData = req.body;
    console.log(data.pollData)
    req.flash("passed_1_part", true);

    res.redirect(`/poll_1_part_2?data=${encodeURIComponent(JSON.stringify(data))}`);
});

server.post("/1st_test", async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect("/login");
        return;
    }
    const bodyData = req.body;
    const queryData = req.query.data ? JSON.parse(decodeURIComponent(req.query.data)) : {};
    const pollData = queryData.pollData || {};

    const profession = pollData.profession;

    const characteristics = pollData.characteristics || [];

    let results = ""

    for (let i = 0; i < 169; i++) {
        if (bodyData["value" + i]) {
            results += bodyData["value" + i]
        } else {
            results += "0"
        }
    }
    const user = req.user.id;

    try {
        await Poll.create({
            user,
            profession,
            points: results
        });

        if (queryData.tests && queryData.i < queryData.tests.length) {
            queryData.i++;
            res.redirect('/' + queryData.tests[queryData.i] + '?data=' + encodeURIComponent(JSON.stringify(queryData)));
        } else {
            res.redirect('/polls_results');
        }
    } catch (err) {
        console.error(err);
        res.status(500).send('Internal Server Error');
    }
});


server.get('/polls_results', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const loggedIn = true
    const adminUser = req.user.isAdmin;

    try {
        const polls = await Poll.findAll();
        res.render('ResultsPage', {polls, loggedIn, adminUser});
    } catch (error) {
        console.error(error);
        res.status(500).send('Internal Server Error');
    }
})

server.post('/reaction_test', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const user = req.user.id
    const type = req.body.testType
    const reactionTime = req.body.reactionTime

    let data = null

    if (req.query.data) {
        data = JSON.parse(decodeURIComponent(req.query.data))
        data.i++;
    }

    try {
        const reactionTest = await ReactionTest.create({user, type, reactionTime})

        if (data) {
            if (data.i - 1 !== data.tests.length) {
                res.redirect('/' + data.tests[data.i - 1] + '?data=' + encodeURIComponent(JSON.stringify(data)))
            } else {
                res.redirect('/polls_results')
            }
        } else {
            return res.redirect('/polls_results')
        }
    } catch (e) {
        console.log(e)
    }
})

server.post('/complex_reaction_test', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const user = req.user.id
    const type = req.body.testType
    const reactionTime1 = req.body.reactionTimings[0]
    const reactionTime2 = req.body.reactionTimings[1]
    const reactionTime3 = req.body.reactionTimings[2]

    let data = null

    if (req.query.data) {
        data = JSON.parse(decodeURIComponent(req.query.data))
        data.i++;
    }

    try {
        const complexReactionTest = await ComplexReactionTest.create({
            user,
            type,
            reactionTime1,
            reactionTime2,
            reactionTime3
        })

        if (data) {
            if (data.i - 1 !== data.tests.length) {
                res.redirect('/' + data.tests[data.i - 1] + '?data=' + encodeURIComponent(JSON.stringify(data)))
            } else {
                res.redirect('/polls_results')
            }
        } else {
            return res.redirect('/polls_results')
        }
    } catch (e) {
        console.log(e)
    }

})

server.post('/accuracy_test', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const user = req.user.id
    const type = req.body.testType
    const accuracy = req.body.accuracy

    let data = null

    if (req.query.data) {
        data = JSON.parse(decodeURIComponent(req.query.data))
    }

    try {
        const accuracyTest = await AccuracyTest.create({user, type, accuracy})

        if (data) {
            if (data.i - 1 !== data.tests.length) {
                res.redirect('/' + data.tests[data.i - 1] + '?data=' + encodeURIComponent(JSON.stringify(data)))
            } else {
                res.redirect('/polls_results')
            }
        } else {
            return res.redirect('/polls_results')
        }
    } catch (e) {
        console.log(e)
    }
})

server.post('/abstract_test', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const user = req.user.id
    const type = req.body.testType
    const result = req.body.result

    let data = null

    if (req.query.data) {
        data = JSON.parse(decodeURIComponent(req.query.data))
    }

    try {
        const abstracttest = await AbstractTest.create({user, type, result})

        if (data) {
            if (data.i - 1 !== data.tests.length) {
                res.redirect('/' + data.tests[data.i - 1] + '?data=' + encodeURIComponent(JSON.stringify(data)))
            } else {
                res.redirect('/polls_results')
            }
        } else {
            return res.redirect('/polls_results')
        }
    } catch (e) {
        console.log(e)
    }
})


server.post('/create_invite', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const userWhoCreated = req.user.id;
    const used = false;
    const tests = req.body.tests;
    const code = crypto.randomBytes(10).toString('hex');
    try {
        const inviteLink = await InviteLink.create({userWhoCreated, tests, code, used})
        res.send({link: '/invite/' + code})
    } catch (e) {
        console.log(e)
    }
})
server.get('/adminPage', async (req, res) => {
    if (req.isAuthenticated()) {
        username = req.user.login;
        adminUser = req.user.isAdmin;
        loggedIn = true;

        const adminLogins = await getAdmins();
        res.render('AdminPage', {logins: adminLogins});
    } else {
        username = "";
        adminUser = false;
        loggedIn = false;
        res.redirect('/login')
    }
});

server.get('/expert_:id', async (req, res) => {
    function getCharacteristics(characteristicsString, characteristicsDict) {
        let characteristicsList = [];

        if (typeof characteristicsString !== 'string') {
            return characteristicsList;
        }

        let characteristicsArray = characteristicsString.split('');

        characteristicsArray.forEach((characteristic, index) => {
            if (characteristic != '0' && characteristicsDict.hasOwnProperty(index)) {

                characteristicsList.push({
                    characteristic: characteristicsDict[index],
                    importance: parseInt(characteristic, 10)
                });
            }
        });

        characteristicsList.sort((a, b) => b.importance - a.importance);


        return characteristicsList.map(item => item.characteristic);
    }

    if (req.isAuthenticated()) {
        try {
            username = req.user.login;
            adminUser = req.user.isAdmin;
            loggedIn = true;

            const id = req.params.id;
            const user = await User.findOne({where: {id: id}});
            console.log(user);
            const polls = await getExpertPolls(user.id);
            let characteristicsLists = polls.map(poll => {
                return {
                    profession: poll.profession,
                    characteristics: getCharacteristics(poll.points, char_dict)
                };
            });
            console.log(characteristicsLists);
            res.render('ExpertPage', {user: user, polls: characteristicsLists});
        } catch (error) {
            console.error(error);
            res.status(500).send('Ошибка при получении информации об эксперте');
        }
    } else {
        res.redirect('/login');
    }
});


server.get('/characteristics', async (req, res) => {
    if (!req.isAuthenticated()) {
        adminUser = false;
        loggedIn = false;
        res.redirect('/login')
        return
    }
    adminUser = true;
    loggedIn = true;

    await StatisticAll.destroy({ where: {} });

    const users = await getUsers();

    for (const user of users) {
        console.log(user);
        const reactionTests = ['sound', 'light'];
        for (const testType of reactionTests) {
            let result = await getResultNumberTest(user, 'reaction', testType);

            if (result == null) {
                result = 0;
            }

            const heartRateCheck = await getHeartRateCheck(user, testType);

            await StatisticAll.create({
                user: user,
                type: testType,
                result: result,
                heartRateCheck: heartRateCheck ? true : false
            });
        }

        const accuracyTests = ['hard_action', 'easy_action', 'analog_tracking_test'];
        for (const testType of accuracyTests) {
            let result = await getResultNumberTest(user, 'accuracy', testType);

            if (result == null) {
                result = 0;
            }

            const heartRateCheck = await getHeartRateCheck(user, testType);

            await StatisticAll.create({
                user: user,
                type: testType,
                result: result,
                heartRateCheck: heartRateCheck ? true : false
            });
        }

        const complex_reaction = ['3_colors', 'math_sound_test', 'math_vis'];
        for (const testType of complex_reaction) {
            let result = await getResultNumberTest(user, 'complex_reaction', testType);

            if (result == null) {
                result = 0;
            }

            const heartRateCheck = await getHeartRateCheck(user, testType);

            await StatisticAll.create({
                user: user,
                type: testType,
                result: result,
                heartRateCheck: heartRateCheck ? true : false
            });
        }

        const abstracttests = ['random_access_memory', 'short_term_memory_test', 'myunsterberg_test', 'compare_test', 'attention_assessment_test', 'abstract_thinking_test', 'abstract_test'];
        for (const testType of abstracttests) {
            let result = await getResultNumberTest(user, 'abstract_test', testType);
            if (result == null) {
                result = 0;
            }
            const heartRateCheck = await getHeartRateCheck(user, testType);

            await StatisticAll.create({
                user: user,
                type: testType,
                result: result,
                heartRateCheck: heartRateCheck ? true : false
            });
        }
    }


    const professions = await Profession.findAll();
    res.render('SecondPage', {professions: professions});
});

server.get('/add_profession', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    res.render('AddProfession');
});

server.post('/add_profession', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    const {profession, competition, salary, study, description, task} = req.body;
    try {
        await Profession.create({
            profession,
            competition,
            salary,
            study,
            description,
            task
        });
        res.redirect('/characteristics');
    } catch (error) {
        res.render('AddProfession', {error: error.message});
    }
});


async function getUserTestResults(userId, relevantPvk) {
    try {
        const relevantPvkIds = relevantPvk.map(pvkName => {
            for (let id in char_dict) {
                if (char_dict[id] === pvkName) {
                    return parseInt(id);
                }
            }
            return null;
        }).filter(id => id !== null);

        console.log('relevantPvkIds:', relevantPvkIds);

        const testResults = await StatisticAll.findAll({
            where: { user: userId }
        });

        const relevantTests = Object.keys(testToQualityMap).filter(testType =>
            testToQualityMap[testType].some(pvk => relevantPvkIds.includes(pvk))
        );

        console.log('relevantTests:', relevantTests);

        const filteredTestResults = testResults.filter(test => relevantTests.includes(test.type));

        console.log('filteredTestResults:', filteredTestResults);

        return { filteredTestResults, totalTestsCount: testResults.length };
    } catch (error) {
        console.error('Error retrieving user test results:', error);
        throw error;
    }
}



function getCharDictKeyByValue(value) {
    return Object.keys(char_dict).find(key => char_dict[key] === value);
}

async function calculateMetric(testResults, totalTestsCount, qualities) {
    const averageValues = {
        'sound': 270,
        'light': 0,
        'visual_math_test': 280,
        'pulse_test': 70,
        'hard_action': 240,
        'easy_action': 220,
        'analog_tracking_test': 45,
        '3_colors': 245,
        'math_sound_test': 270,
        'math_vis': 280,
        'random_access_memory': 4,
        'short_term_memory_test': 4,
        'myunsterberg_test': 4,
        'compare_test': 10,
        'attention_assessment_test': 4,
        'abstract_thinking_test': 4,
        'abstract_test': 3,
    };

    // Присваиваем веса на основе порядка важности ПВК
    const weights = {};
    qualities.forEach((quality, index) => {
        const key = getCharDictKeyByValue(quality.characteristic);
        weights[key] = 10 - index; // Приоритет от 10 до 1
    });

    let totalScore = 0;

    // Максимальный возможный вес
    const maxTotalScore = Array.from({ length: totalTestsCount }, (_, i) => 10 - i)
        .reduce((acc, val) => acc + val, 0);

    for (const [testType, qualityIds] of Object.entries(testToQualityMap)) {
        const result = testResults.find(test => test.type === testType);
        if (result) {
            const userValue = parseFloat(result.result);
            const averageValue = averageValues[testType];
            const qualityWeights = qualityIds.map(q => weights[q] || 0);
            const weight = Math.max(...qualityWeights);

            console.log(`Calculating score for test type ${testType}: userValue = ${userValue}, averageValue = ${averageValue}, weight = ${weight}`);

            if (userValue >= averageValue * 1.1) {
                totalScore += weight;
            } else if (userValue >= averageValue * 0.9) {
                totalScore += weight / 2;
            }
        }
    }

    console.log('totalScore:', totalScore);
    console.log('maxTotalScore:', maxTotalScore);

    const scorePercentage = (totalScore / maxTotalScore) * 100;

    if (scorePercentage >= 75) {
        return 1; // Профессия рекомендуется
    } else if (scorePercentage >= 55) {
        return 2; // Рекомендуется развить некоторые ПВК
    } else {
        return 3; // Профессия не рекомендуется
    }
}




server.get('/professions_:id', async (req, res) => {
    if (req.isAuthenticated()) {
        try {
            const id = req.params.id;
            const userID = req.user.id;
            const profession = await Profession.findOne({ where: { id: id } });
            if (!profession) {
                console.error('Профессия с ID', id, 'не найдена');
                res.status(404).send('Профессия не найдена');
                return;
            }

            const characteristics = await getProfessionCharacteristics(id);
            const qualities = await aggregateExpertRatings(profession.profession);

            const relevantPvk = qualities.map(quality => quality.characteristic);
            const { filteredTestResults, totalTestsCount } = await getUserTestResults(userID, relevantPvk);
            const metric = await calculateMetric(filteredTestResults, totalTestsCount, qualities);

            console.log('qualities:', qualities);

            res.render('ProfessionPage', {
                profession: profession,
                characteristics: characteristics,
                qualities: qualities,
                testResults: filteredTestResults,
                totalTestsCount: totalTestsCount,
                metric: metric,
                loggedIn: req.isAuthenticated(),
                adminUser: req.user.isAdmin,
                testToQualityMap: testToQualityMap,
                char_dict: char_dict,
                relevantPvk: relevantPvk
            });
        } catch (error) {
            console.error('Ошибка при получении информации о профессии:', error);
            res.status(500).send('Ошибка при получении информации о профессии');
        }
    } else {
        res.redirect('/login');
    }
});

server.get('/add_heart_rate', (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    res.render('AddHeartRate');
});

server.post('/add_heart_rate', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login');
        return;
    }

    const { respondentID, testType, heartRateBefore, heartRateAfter } = req.body;
    const heartRateDuringValues = req.body.heartRateDuring;

    const check = await getHeartCheck(heartRateBefore, heartRateDuringValues, heartRateAfter);

    try {
        await HeartRate.create({
            respondentID,
            testType,
            heartRateBefore,
            heartRateDuring: heartRateDuringValues,
            heartRateAfter,
            check
        });

        res.redirect('/add_heart_rate');
    } catch (error) {
        res.render('AddHeartRate', { error: error.message });
    }
});
const { Op } = require('sequelize')
/*
async function countPassedTests(userId) {
        count = await StatisticAll.count({
        where: {
            user: userId,
            result: {
                [Op.ne]: 0
            }
        }

    });
    console.log('countPassedTests:', count);
}
*/

server.get('/my_page', async (req, res) => {
    if (!req.isAuthenticated()) {
        res.redirect('/login')
        return
    }

    adminUser = req.user.isAdmin;
    respondentUser = req.user.respondent;
    var countPT = await StatisticAll.count({
        where: {
            user: req.user.id,
            result: {
                [Op.ne]: 0
            }
        }

    });
    let userEmail = '';
    if (respondentUser) {
        userEmail = req.user.email;
    }

    res.render('my_page', {
        username: req.user.login,
        id: req.user.id,
        email: userEmail,
        countPT: countPT,
        loggedIn: req.isAuthenticated(),
        adminUser: adminUser,
        respondentUser: respondentUser
    });
});

async function updateUserEmailAndRespondentStatus(userId, newEmail) {
    await User.update(
        { email: newEmail, respondent: true },
        { where: { id: userId } })
        .success(result =>
            handleResult(result)
        )
        .error(err =>
            handleError(err)
        );
}
server.post('/setmail', async (req, res) => {
    if (req.isAuthenticated()) {
        try{
            await updateUserEmailAndRespondentStatus(req.user.id, req.body.email)
        }catch (error){
            res.status(500).send('Ошибка при записи email'+error.toString());
        }
    }else {
        res.redirect('/mypage');
    }
});

async function aggregateExpertRatings(professionName) {
    try {
        const polls = await Poll.findAll({
            where: {
                profession: professionName
            }
        });
        console.log(polls);

        let ratingsSum = new Array(168).fill(0);
        polls.forEach(poll => {
            poll.points.split('').forEach((rating, index) => {
                if (rating !== '0') {
                    ratingsSum[index] += parseInt(rating, 10);
                }
            });
        });

        let aggregatedRatings = ratingsSum.map((sum, index) => ({
            characteristic: char_dict[index],
            totalImportance: sum
        }))
            .filter(item => item.totalImportance > 0)
            .sort((a, b) => b.totalImportance - a.totalImportance)
            .slice(0, 10);

        return aggregatedRatings;
    } catch (err) {
        console.error('Ошибка при агрегации рейтингов:', err);
        throw err;
    }
}


// HERE IS YOUR CODE



sequelize.sync().then(() => {
    server.listen(3000, () => {
        console.log('Server running on http://localhost:3000');
    });
});
