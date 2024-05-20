// Состояние тестов
let currentTest = 'sound-math'; // Начнем с теста Sound Math
let switchCounter = 0; // Счётчик переключений
const MAX_SWITCHES = 8;
const NUM_OF_TESTS = 1; // Определяем количество тестов на звуковую математику (1 вопрос)
const NUM_OF_COLOR_TESTS = 3; // Определяем количество тестов на цветовую реакцию (3 появления цвета)
let testRunning = false;
// Объект для хранения результатов тестирования
const testResults = {
    soundMath: [],
    colorReaction: [],
    addResult(testType, result) {
        if (testType === 'sound-math') {
            this.soundMath.push(result);
        } else if (testType === 'color-reaction') {
            this.colorReaction.push(result);
        }
    },
    sendData() {
        const data = {
            soundMath: this.soundMath,
            colorReaction: this.colorReaction
        };
        console.log('Sending data:', data);
        fetch('/save-test-results', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data)
        })
            .then(response => response.json())
            .then(data => {
                console.log('Success:', data);
                alert('Results saved successfully!');
            })
            .catch((error) => {
                console.error('Error:', error);
                alert('Failed to save results.');
            });
    }
};

// Функция для начала теста
function startTest() {
    document.getElementById('start-button-enclosing').style.display = 'none';
    runSoundMathTest();
}

// Функция для переключения тестов
function switchTest() {
    if (switchCounter < MAX_SWITCHES) {
        if (currentTest === 'sound-math') {
            currentTest = 'color-reaction';
            runColorReactionTest();
        } else {
            currentTest = 'sound-math';
            runSoundMathTest();
        }
        switchCounter++;
    } else {
        endTests();
    }
}

// Логика Sound Math Test
function runSoundMathTest() {
    console.log("Starting Sound Math Test");
    initializeSoundMathElements();
    progressSoundElement.value = (switchCounter / MAX_SWITCHES) * 100;
    startSoundMathLogic(function(result) {
        testResults.addResult('sound-math', result);
        console.log("Sound Math Test completed with result:", result);
        switchTest();
    });
}

let problemDiv, progressSoundElement, incorrectField, answerButtonsDiv;

function initializeSoundMathElements() {
    problemDiv = document.getElementById("problem");
    progressSoundElement = document.getElementById("progress-sound");
    incorrectField = document.getElementById("incorrect_field");
    answerButtonsDiv = document.getElementById("answer_buttons");
}

function startSoundMathLogic(callback) {
    let problems = [];
    let timings = [];
    let startTime, testCounter = 0;

    runTest();

    function runTest() {
        progressSoundElement.value = (testCounter / NUM_OF_TESTS) * 100;
        problemDiv.innerHTML = "";
        incorrectField.innerHTML = "";
        answerButtonsDiv.innerHTML = "";

        let { numbers, isEven } = generateProblem();
        problems.push({ numbers, isEven });

        let problem = numbers.join(" + ");
        problemDiv.innerHTML = problem;

        const utterance = new SpeechSynthesisUtterance(problem);
        window.speechSynthesis.speak(utterance);

        ["Четная", "Нечетная"].forEach((label, index) => {
            let button = document.createElement("button");
            button.textContent = label;
            button.onclick = () => {
                let endTime = performance.now();
                let reactionTime = endTime - startTime;
                timings.push(reactionTime);
                checkAnswer(index === 0, isEven);
            };
            answerButtonsDiv.appendChild(button);
        });

        startTime = performance.now();
    }

    function generateProblem() {
        let numbers = Array.from({ length: 2 }, () => Math.floor(Math.random() * 20));
        let isEven = numbers.reduce((a, b) => a + b, 0) % 2 === 0;
        return { numbers, isEven };
    }

    function checkAnswer(userAnswer, correctAnswer) {
        if (userAnswer === correctAnswer) {
            incorrectField.innerHTML = "Correct!";
        } else {
            incorrectField.innerHTML = "Incorrect!";
        }
        testCounter++;
        if (testCounter < NUM_OF_TESTS) {
            setTimeout(runTest, 1000);
        } else {
            callback({ problems, timings });
        }
    }
}

// Логика Color Reaction Test
function runColorReactionTest() {
    console.log("Starting Color Reaction Test");
    initializeColorReactionElements();
    progressColorElement.value = (switchCounter / MAX_SWITCHES) * 100;
    startColorReactionLogic(function(result) {
        testResults.addResult('color-reaction', result);
        console.log("Color Reaction Test completed with result:", result);
        switchTest();
    });
}

let squaresDiv, progressColorElement, resultDiv;

function initializeColorReactionElements() {
    squaresDiv = document.getElementById("squares");
    progressColorElement = document.getElementById("progress-color");
    resultDiv = document.getElementById("result");

    // Создание квадратов
    squaresDiv.innerHTML = "";
    const squareLetters = ['Z', 'X', 'C'];
    for (let i = 0; i < 3; i++) {
        const squareDiv = document.createElement("div");
        squareDiv.className = "square";
        squareDiv.textContent = squareLetters[i];
        squaresDiv.appendChild(squareDiv);
    }
}

function startColorReactionLogic(callback) {
    let timings = [];
    let startTime, testCounter = 0;

    runTest();

    function runTest() {
        if (testCounter < NUM_OF_COLOR_TESTS) {
            resetSquares();
            let randomIndex = Math.floor(Math.random() * 3);
            let colors = ["red", "green", "blue"];
            let keyMap = { "z": "red", "x": "green", "c": "blue" };
            let correctColor = colors[randomIndex];
            let squares = document.querySelectorAll('.square');
            squares[randomIndex].style.backgroundColor = correctColor;

            startTime = performance.now();

            document.addEventListener("keydown", function handler(event) {
                if (keyMap[event.key]) {
                    let endTime = performance.now();
                    let reactionTime = endTime - startTime;
                    timings.push(reactionTime);
                    checkColorAnswer(event.key, keyMap[event.key], squares[randomIndex]);
                    document.removeEventListener("keydown", handler);
                }
            });

            testCounter++;
        } else {
            callback({ timings });
        }
    }

    function resetSquares() {
        document.querySelectorAll('.square').forEach(square => {
            square.style.backgroundColor = 'white';
        });
    }

    function checkColorAnswer(userKey, correctColor, square) {
        if (userKey === correctColor) {
            resultDiv.innerHTML = "Correct!";
        } else {
            resultDiv.innerHTML = "Incorrect!";
        }
        square.style.backgroundColor = 'white';
        setTimeout(runTest, 1000);
    }
}

// Завершение тестов и отображение результатов
function endTests() {
    document.getElementById('sound-math-test').style.display = 'none';
    document.getElementById('color-reaction-test').style.display = 'none';
    console.log('Tests completed after ' + MAX_SWITCHES + ' switches.');

    document.getElementById('results-container').style.display = 'block';
    document.getElementById('sound-math-results').innerHTML = `Sound Math Test Results: ${testResults.soundMath.map(r => `Average Time: ${r.timings.reduce((a, b) => a + b, 0) / r.timings.length}ms`).join(', ')}`;
    document.getElementById('color-reaction-results').innerHTML = `Color Reaction Test Results: ${testResults.colorReaction.map(r => `Average Time: ${r.timings.reduce((a, b) => a + b, 0) / r.timings.length}ms`).join(', ')}`;
}

document.getElementById('send-data-button').onclick = () => testResults.sendData();
document.getElementById('restart-button').onclick = () => {
    document.getElementById('results-container').style.display = 'none';
    document.getElementById('start-button-enclosing').style.display = 'block';
    testResults.soundMath = [];
    testResults.colorReaction = [];
    switchCounter = 0;
    currentTest = 'sound-math';
    testRunning = false;
    document.getElementById('sound-math-test').style.display = 'block';
    document.getElementById('color-reaction-test').style.display = 'block';
    document.getElementById('problem').innerHTML = '';
    document.getElementById('incorrect_field').innerHTML = '';
    document.getElementById('answer_buttons').innerHTML = '';
    document.getElementById('squares').innerHTML = '';
    document.getElementById('result').innerHTML = '';
};

// Обработчик события для кнопки начала теста
document.getElementById('start-button').addEventListener('click', () => {
    if (!testRunning) {
        testRunning = true;
        startTest();
    }
});
