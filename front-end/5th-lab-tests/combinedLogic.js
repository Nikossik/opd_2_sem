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
    startSoundMathLogic(function(result) {
        testResults.addResult('sound-math', result);
        console.log("Sound Math Test completed with result:", result);
        switchTest();
    });
}

function runColorReactionTest() {
    console.log("Starting Color Reaction Test");
    startColorReactionLogic(function(result) {
        testResults.addResult('color-reaction', result);
        console.log("Color Reaction Test completed with result:", result);
        switchTest();
    });
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


function endTests() {
    document.getElementById('sound-math-test').style.display = 'none';
    document.getElementById('color-reaction-test').style.display = 'none';
    console.log('Tests completed after ' + MAX_SWITCHES + ' switches.');

    // Отображение результатов на странице
    const resultsContainer = document.createElement('div');
    resultsContainer.innerHTML = `
        <h2>Test Results Summary</h2>
        <p>Sound Math Test Results: ${testResults.soundMath.join(', ')}</p>
        <p>Color Reaction Test Results: ${testResults.colorReaction.join(', ')}</p>
    `;
    document.body.appendChild(resultsContainer);

    // Кнопка отправки данных
    const sendDataButton = document.createElement('button');
    sendDataButton.textContent = 'Send Data';
    sendDataButton.onclick = () => testResults.sendData();
    document.body.appendChild(sendDataButton);
}


