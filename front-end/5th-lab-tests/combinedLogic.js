// Состояние тестов
let currentTest = 'sound-math'; // Начнем с теста Sound Math
let testRunning = false;
let switchCounter = 0; // Счётчик переключений

// Константы для контроля количества переключений и времени выполнения
const MAX_SWITCHES = 8;

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
    if (switchCounter < MAX_SWITCHES) {
        document.getElementById('start-button-enclosing').style.display = 'none';
        if (currentTest === 'sound-math') {
            document.getElementById('sound-math-test').style.display = 'block';
            document.getElementById('color-reaction-test').style.display = 'none';
            runSoundMathTest();
        } else {
            document.getElementById('sound-math-test').style.display = 'none';
            document.getElementById('color-reaction-test').style.display = 'block';
            runColorReactionTest();
        }
        testRunning = true;
        switchCounter++;
    } else {
        endTests();
    }
}

// Функция для переключения тестов
function switchTest() {
    currentTest = (currentTest === 'sound-math') ? 'color-reaction' : 'sound-math';
    startTest();
}

// Логика Sound Math Test
function runSoundMathTest() {
    console.log("Starting Sound Math Test");
    startSoundMathLogic(function(result) {
        testResults.addResult('sound-math', result);
        console.log("Sound Math Test completed with result:", result);
        switchTest();
    });
}

// Инициализация элементов Sound Math Test
let problemDiv, progressElement, incorrectField, answerButtonsDiv, submitButtonEnclosing;
let numberOfNumbers = 2; // Значение всегда 2

function initializeSoundMathElements() {
    problemDiv = document.getElementById("problem");
    progressElement = document.getElementById("progress");
    incorrectField = document.getElementById("incorrect_field");
    answerButtonsDiv = document.getElementById("answer_buttons");
    submitButtonEnclosing = document.getElementById("submit-button-enclosing");
}

let problems = [], timings = [], results = [];
const NUM_OF_TESTS = 9;
let testCounter = 0, testPassed = false;

function startSoundMathLogic(callback) {
    initializeSoundMathElements();
    runTest();

    function runTest() {
        if (testCounter < NUM_OF_TESTS) {
            progressElement.value = (testCounter / NUM_OF_TESTS) * 100;
            problemDiv.innerHTML = "";
            incorrectField.innerHTML = "";
            answerButtonsDiv.innerHTML = "";
            submitButtonEnclosing.innerHTML = "";

            let { numbers, isEven } = generateProblem();
            let problem = "";

            problems.push(numbers)

            for (let i = 0; i < numberOfNumbers; i++) {
                if (i !== numberOfNumbers - 1) {
                    problem += numbers[i] + "+"
                } else {
                    problem += numbers[i]
                }
            }

            // voice acting
            const utterance = new SpeechSynthesisUtterance(problem);
            window.speechSynthesis.speak(utterance);

            let evenButton = document.createElement("button")
            evenButton.innerHTML = "Четная"
            evenButton.value = "Четная"
            evenButton.name = "answer_button"
            evenButton.addEventListener("click", checkAnswer)
            document.getElementById("answer_buttons").appendChild(evenButton)

            let oddButton = document.createElement("button")
            oddButton.innerHTML = "Нечетная"
            oddButton.value = "Нечетная"
            oddButton.name = "answer_button"
            oddButton.addEventListener("click", checkAnswer)
            document.getElementById("answer_buttons").appendChild(oddButton)

            let startTime = new Date().getTime();

            function checkAnswer(event) {
                if ((event.srcElement.value === "Нечетная" && isEven === false) || (event.srcElement.value === "Четная" && isEven === true)) {
                    let endTime = new Date().getTime()
                    timings.push(endTime - startTime)
                    document.getElementById("incorrect_field").innerHTML = "Всё верно!";
                    document.getElementById("answer_buttons").innerHTML = "";
                    testCounter++;
                    runTest();
                } else {
                    document.getElementById("incorrect_field").innerHTML = "Неправильно, попробуйте еще раз!";
                }
            }

        } else {
            testCounter = 0;
            results.push(timings);
            timings = [];

            document.getElementById("incorrect_field").innerHTML = ""; // здесь бы прописать результат, но я не понимаю, что именно он выводит

            const submitButton = document.createElement("button")
            submitButton.type = "submit"
            submitButton.onclick = sendData
            submitButton.textContent = "Отправить результат"
            document.getElementById("submit-button-enclosing").appendChild(submitButton)

            testPassed = true;

            const startButton = document.createElement("button")
            startButton.id = "start-button"
            startButton.textContent = "Пройти заново"
            startButton.onclick = runTest
            document.getElementById("start-button-enclosing").appendChild(startButton)

            progressElement.value = 0
        }
    }

    async function sendData() {
        if (testPassed) {
            const reactionTimings = [results.at(-1).slice(0, 3).reduce((a, b) => a + b, 0) / 3,
                results.at(-1).slice(3, 6).reduce((a, b) => a + b, 0) / 3,
                results.at(-1).slice(6).reduce((a, b) => a + b, 0) / 3]

            const data = {
                testType: "math_sound_test",
                reactionTimings: reactionTimings
            }

            let url = ''
            const urlObject = new URL(window.location.href)

            if (urlObject.searchParams.has('data')) {
                url += '/complex_reaction_test?data=' + urlObject.searchParams.get('data')
            } else {
                url += '/complex_reaction_test'
            }

            await fetch(url, {
                method: 'POST',
                body: JSON.stringify(data),
                headers: { 'Content-Type': 'application/json' },
            })
                .then(res => {
                    console.log(res)
                    // Redirect to another URL
                    window.location.href = res.url;
                })
                .catch(error => console.error(error));
        }
    }

    function generateProblem() {
        let numbers = []

        for (let i = 0; i < numberOfNumbers; i++) {
            numbers.push(Math.round(Math.random() * 20))
        }

        let isEven = numbers.reduce((a, b) => a + b, 0) % 2 === 0

        return { numbers, isEven }
    }
}

// Логика Color Reaction Test
let squaresDiv, progressColorElement, startButtonColor, submitButtonEnclosingColor, resultEnclosingColor, resultColor;
let colorProblems = [], colorTimings = [], colorResults = [];
const NUM_OF_COLOR_TESTS = 10;
let colorTestCounter = 0;

function initializeColorReactionElements() {
    squaresDiv = document.getElementById("squares");
    progressColorElement = document.getElementById("progress-color");
    startButtonColor = document.getElementById("start-button-color");
    submitButtonEnclosingColor = document.getElementById("submit-button-enclosing-color");
    resultEnclosingColor = document.getElementById("result-enclosing-color");
    resultColor = document.getElementById("result-color");
}

function startColorReactionLogic(callback) {
    initializeColorReactionElements();
    runColorTest();

    function runColorTest() {
        if (colorTestCounter < NUM_OF_COLOR_TESTS) {
            progressColorElement.value = (colorTestCounter / NUM_OF_COLOR_TESTS) * 100;
            squaresDiv.innerHTML = "";
            resultColor.innerHTML = "";

            let colors = ["red", "green", "blue"];
            let randomColor = colors[Math.floor(Math.random() * colors.length)];
            colorProblems.push(randomColor);

            let square = document.createElement("div");
            square.className = "square";
            square.style.backgroundColor = randomColor;

            let startTime = performance.now();
            let keyMap = {
                "z": "red",
                "x": "green",
                "c": "blue"
            };

            document.addEventListener("keydown", function handler(event) {
                if (keyMap[event.key]) {
                    let endTime = performance.now();
                    let reactionTime = endTime - startTime;
                    colorTimings.push(reactionTime);
                    checkColorAnswer(event.key, keyMap[randomColor]);
                    document.removeEventListener("keydown", handler);
                }
            });

            squaresDiv.appendChild(square);
            colorTestCounter++;
        } else {
            endColorReactionTest();
        }
    }

    function checkColorAnswer(userKey, correctColor) {
        if (keyMap[userKey] === correctColor) {
            resultColor.innerHTML = "Correct!";
        } else {
            resultColor.innerHTML = "Incorrect!";
        }
        setTimeout(runColorTest, 1000);
    }

    function endColorReactionTest() {
        let averageColorTime = colorTimings.reduce((a, b) => a + b, 0) / colorTimings.length;
        colorResults.push({ colorProblems, colorTimings, averageColorTime });
        callback({ colorProblems, colorTimings, averageColorTime });
    }
}

// Завершение тестов и отображение результатов
function endTests() {
    document.getElementById('sound-math-test').style.display = 'none';
    document.getElementById('color-reaction-test').style.display = 'none';
    console.log('Tests completed after ' + MAX_SWITCHES + ' switches.');

    // Отображение результатов на странице
    const resultsContainer = document.createElement('div');
    resultsContainer.innerHTML = `
        <h2>Test Results Summary</h2>
        <p>Sound Math Test Results: ${testResults.soundMath.map(r => `Average Time: ${r.averageTime}ms`).join(', ')}</p>
        <p>Color Reaction Test Results: ${testResults.colorReaction.map(r => `Average Time: ${r.averageColorTime}ms`).join(', ')}</p>
    `;
    document.body.appendChild(resultsContainer);

    // Кнопка отправки данных
    const sendDataButton = document.createElement('button');
    sendDataButton.textContent = 'Send Data';
    sendDataButton.onclick = () => testResults.sendData();
    document.body.appendChild(sendDataButton);
}

// Обработчик события для кнопки начала теста
document.getElementById('start-button').addEventListener('click', () => {
    if (!testRunning) {
        startTest();
    }
});
