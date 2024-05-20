// Состояние тестов
let currentTest = 'sound-reaction'; // Начнем с теста Sound Reaction
let testRunning = false;
let switchCounter = 0; // Счётчик переключений

// Константы для контроля количества переключений и времени выполнения
const MAX_SWITCHES = 8;

// Объект для хранения результатов тестирования
const testResults = {
    soundReaction: [],
    colorReaction: [],
    addResult(testType, result) {
        if (testType === 'sound-reaction') {
            this.soundReaction.push(result);
        } else if (testType === 'color-reaction') {
            this.colorReaction.push(result);
        }
    },
    sendData() {
        const data = {
            soundReaction: this.soundReaction,
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
        if (currentTest === 'sound-reaction') {
            document.getElementById('sound-reaction-test').style.display = 'block';
            document.getElementById('color-reaction-test').style.display = 'none';
            runSoundReactionTest();
        } else {
            document.getElementById('sound-reaction-test').style.display = 'none';
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
    currentTest = (currentTest === 'sound-reaction') ? 'color-reaction' : 'sound-reaction';
    startTest();
}

// Логика Sound Reaction Test
function runSoundReactionTest() {
    console.log("Starting Sound Reaction Test");
    startSoundReactionLogic(function(result) {
        testResults.addResult('sound-reaction', result);
        console.log("Sound Reaction Test completed with result:", result);
        switchTest();
    });
}

function startSoundReactionLogic(callback) {
    let bodyElement = document.getElementsByTagName("body")[0];
    let startTime, testStarted = false, testPassed = false;
    let testResults = [];
    const numTests = 3; // number of times to play the sound
    let currentTestNum = 0;

    const audio = new Audio("images/sound.mp3");

    async function sendData(){
        if(testPassed){
            const data = {
                testType: "sound",
                reactionTime: testResults.reduce((a, b) => a + b, 0) / testResults.length
            };

            let url = '';
            const urlObject = new URL(window.location.href);

            if (urlObject.searchParams.has('data')){
                url += '/reaction_test?data=' + urlObject.searchParams.get('data');
            } else {
                url += '/reaction_test';
            }

            console.log(JSON.stringify(data));

            await fetch(url, {
                method: 'POST',
                body: JSON.stringify(data),
                headers: { 'Content-Type': 'application/json' },
            })
                .then(res => {
                    console.log(res);
                    // Redirect to another URL
                    window.location.href = res.url;
                })
                .catch(error => console.error(error));
        }
    }

    function handleKeyPress(event) {
        if (event.keyCode === 32) { // проверяем, что нажата именно клавиша пробел
            if (testStarted){
                let endTime = new Date().getTime();
                let reactionTime = endTime - startTime;
                testResults.push(reactionTime);
                document.getElementById("reaction-time-enclosing").innerHTML = "Ваше время реакции на звук: " + reactionTime + " мс";
                testStarted = false;

                const progressValue = (currentTestNum / numTests) * 100;
                document.getElementById("progress").value = progressValue;

                if (!testPassed && currentTestNum >= numTests) {
                    document.getElementById("reaction-time-enclosing").innerHTML = "Результаты теста: " + testResults.join(" мс, ") + " мс.";

                    const submitButton = document.createElement("button");
                    submitButton.innerHTML = "ОТПРАВИТЬ РЕЗУЛЬТАТ";
                    submitButton.onclick = sendData;
                    document.getElementById("send-button-enclosing").appendChild(submitButton);

                    const restartButton = document.createElement("button");
                    restartButton.innerHTML = "Начать заново";
                    restartButton.onclick = function () {
                        testResults = [];
                        testPassed = false;
                        currentTestNum = 0;
                        document.getElementById("reaction-time-enclosing").innerHTML = "";
                        document.getElementById("send-button-enclosing").innerHTML = "";
                        document.getElementById("progress").value = 0;
                        startButton.style.display = "block";
                        restartButton.style.display = "none";
                    };
                    document.getElementById("restart-button-enclosing").appendChild(restartButton);

                    testPassed = true;
                }
            }
        }
    }

    document.addEventListener("keydown", handleKeyPress);

    function startTest() {
        const playSoundInterval = setInterval(() => {
            if (currentTestNum >= numTests) {
                clearInterval(playSoundInterval);
                if (!testPassed) {
                    document.getElementById("reaction-time-enclosing").innerHTML = "Результаты теста: " + testResults.join(" мс, ") + " мс.";

                    const submitButton = document.createElement("button");
                    submitButton.innerHTML = "ОТПРАВИТЬ РЕЗУЛЬТАТ";
                    submitButton.onclick = sendData;
                    document.getElementById("send-button-enclosing").appendChild(submitButton);
                }
                testPassed = true;
            } else {
                audio.play();
                startTime = new Date().getTime();
                testStarted = true;
                bodyElement.focus();
                currentTestNum++;
            }
        }, Math.floor(Math.random() * 3000) + 1000); // random interval between 1 and 4 seconds
    }

    const startButton = document.createElement("button");
    startButton.innerHTML = "НАЧАТЬ ТЕСТ";
    startButton.onclick = function () {
        startButton.style.display = "none";
        alert("Нажмите на клавишу пробел, когда услышите звук");
        startTest();
    };
    bodyElement.appendChild(startButton);
}

// Логика Color Reaction Test
function runColorReactionTest() {
    console.log("Starting Color Reaction Test");
    startColorReactionLogic(function(result) {
        testResults.addResult('color-reaction', result);
        console.log("Color Reaction Test completed with result:", result);
        switchTest();
    });
}

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
    hideColorButton();
}

function hideColorButton() {
    document.getElementById("start-button-color").style.display = "none";
    const squaresDiv = document.createElement("div");
    squaresDiv.id = "squares";
    const squareLetters = ['Z', 'X', 'C'];
    for (let i = 0; i < 3; i++) {
        const squareDiv = document.createElement("div");
        squareDiv.className = "square";
        squareDiv.textContent = squareLetters[i];
        squaresDiv.appendChild(squareDiv);
    }
    document.body.appendChild(squaresDiv);
    startColorTest();
}

function startColorTest() {
    resetSquares();
    intervalId = setInterval(() => {
        resetSquares();
        const randomIndex = Math.floor(Math.random() * 3);
        document.querySelectorAll('.square')[randomIndex].style.backgroundColor = colors[randomIndex];
        correctAnswer = randomIndex;
        startTime = Date.now();
    }, Math.floor(Math.random() * 2000) + 1000);
}

function resetSquares() {
    document.querySelectorAll('.square').forEach(square => {
        square.style.backgroundColor = 'white';
    });
}

document.addEventListener('keydown', event => {
    if (event.key === 'z') {
        currentSquare = 0;
        checkColorAnswer();
    } else if (event.key === 'x') {
        currentSquare = 1;
        checkColorAnswer();
    } else if (event.key === 'c') {
        currentSquare = 2;
        checkColorAnswer();
    }
});

function checkColorAnswer() {
    clearInterval(intervalId);
    if (currentSquare === correctAnswer) {
        reactionTime = Date.now() - startTime;
        document.getElementById("progress-color").value = colorTestCounter * 10;
        correctTestCounter++;
        colorTestCounter++;
        totalReactionTime += reactionTime;
        results.push(reactionTime);

        document.getElementById('result-color').innerHTML = `Your reaction time: ${reactionTime}ms. Correct!`;
    } else {
        totalReactionTime += reactionTime * 2;
        results.push(reactionTime * 2);
        document.getElementById('result-color').innerHTML = 'Wrong answer. Try again!';
        colorTestCounter++;
    }
    if (colorTestCounter <= 10 && testPassed === false) {
        startColorTest();
    } else if (colorTestCounter > 10 && testPassed === false) {
        testPassed = true;

        document.getElementById("progress-color").value = 0;
        document.getElementById('result-color').innerHTML = '';

        const submitButtonEnclosingColor = document.getElementById("submit-button-enclosing-color");
        const submitButtonColor = document.createElement("button");
        submitButtonColor.textContent = "Отправить результат";
        submitButtonColor.onclick = sendData;
        submitButtonEnclosingColor.appendChild(submitButtonColor);

        const restartButtonEnclosingColor = document.getElementById("restart-button-enclosing-color");
        const restartButtonColor = document.createElement("button");
        restartButtonColor.textContent = "Пройти заново";
        restartButtonColor.addEventListener('click', runColorTest);
        restartButtonEnclosingColor.appendChild(restartButtonColor);

        const resultEnclosingColor = document.getElementById("result-enclosing-color");
        resultEnclosingColor.innerHTML = `You have completed the test! Your average reaction time is ${totalReactionTime / correctTestCounter}ms. You answered ${correctTestCounter} out of 10 correctly.`;
    }
}

// Завершение тестов и отображение результатов
function endTests() {
    document.getElementById('sound-reaction-test').style.display = 'none';
    document.getElementById('color-reaction-test').style.display = 'none';
    console.log('Tests completed after ' + MAX_SWITCHES + ' switches.');

    // Отображение результатов на странице
    const resultsContainer = document.createElement('div');
    resultsContainer.innerHTML = `
        <h2>Test Results Summary</h2>
        <p>Sound Reaction Test Results: ${testResults.soundReaction.map(r => `Average Time: ${r.averageTime}ms`).join(', ')}</p>
        <p>Color Reaction Test Results: ${testResults.colorReaction.map(r => `Average Time: ${r.averageTime}ms`).join(', ')}</p>
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
