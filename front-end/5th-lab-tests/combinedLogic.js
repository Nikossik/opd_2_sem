// Состояние тестов
let currentTest = 'sound-math'; // Начнем с теста Sound Math
let testRunning = false;
let switchCounter = 0; // Счётчик переключений

// Константы для контроля количества переключений и времени выполнения
const MAX_SWITCHES = 8;

function startTest() {
    if (switchCounter < MAX_SWITCHES) {
        if (currentTest === 'sound-math') {
            document.getElementById('sound-math-test').style.display = 'block';
            document.getElementById('color-reaction-test').style.display = 'none';
            // Запуск логики Sound Math Test
            runSoundMathTest();
        } else {
            document.getElementById('sound-math-test').style.display = 'none';
            document.getElementById('color-reaction-test').style.display = 'block';
            // Запуск логики Color Reaction Test
            runColorReactionTest();
        }
        testRunning = true;
        switchCounter++;
    } else {
        endTests();
    }
}

function switchTest() {
    currentTest = (currentTest === 'sound-math') ? 'color-reaction' : 'sound-math';
    startTest();
}

function endTests() {
    // Очистка и завершение работы тестов
    document.getElementById('sound-math-test').style.display = 'none';
    document.getElementById('color-reaction-test').style.display = 'none';
    alert('Tests completed!');
}

document.getElementById('start-button').addEventListener('click', () => {
    if (!testRunning) {
        startTest();
    }
});

document.getElementById('start-button-color').addEventListener('click', () => {
    if (!testRunning) {
        startTest();
    }
});

function runSoundMathTest() {
    console.log("Starting Sound Math Test");
    // Место для внедрения логики теста Sound Math
    // Это может включать в себя начальные настройки, генерацию задач, запуск таймеров и т.д.

    // Предположим, что есть функция для начала теста
    startSoundMathLogic();

    // Как только тест завершается, нужно вызвать функцию switchTest()
    setTimeout(() => {
        console.log("Sound Math Test completed");
        switchTest();
    }, 30000); // Предполагаем, что каждый тест длится 30 секунд
}

function runColorReactionTest() {
    console.log("Starting Color Reaction Test");
    // Место для внедрения логики теста Color Reaction
    // Аналогично, это может включать начальные настройки, установку обработчиков для реакции на изменение цвета и т.д.

    startColorReactionLogic();

    // По завершении теста переключаемся обратно
    setTimeout(() => {
        console.log("Color Reaction Test completed");
        switchTest();
    }, 30000);
}

function endTests() {
    // Очистка интерфейса и сообщение пользователю
    document.getElementById('sound-math-test').style.display = 'none';
    document.getElementById('color-reaction-test').style.display = 'none';
    console.log('Tests completed after ' + MAX_SWITCHES + ' switches.');
    alert('Tests completed! Check the console for details.');
}
