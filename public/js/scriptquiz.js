const questions = [
    {
        question: `Qual o nome do peixe:`,
        img: `<img src="./assets/peixequiz.png">`,
        options: ["Tilápia", "Pirarucu", "Dourado", "Pacu"],
        correct: 0
    },
    {
        question: `Qual das iscas a seguir NÃO é boa para tucunaré?`,
        img: ``,
        options: ["Artificiais", "Lambari", "Camarão", "Massas"],
        correct: 3
    },
    {
        question: `Qual o maior peixe de água doce do Brasil?`,
        img: ``,
        options: ["Jaú", "Piraíba", "Pirarucu", "Piau"],
        correct: 1
    },
    {
        question: `Como se chama este tipo de isca? `,
        img: `<img src="./assets/isca1.png">`,
        options: ["Plug/Meia água", "Jig/Peninha", "Popper", "Zara/Lápis"],
        correct: 1
    },
    {
        question: `Qual a isca ideal para Pirarara?`,
        img: ``, 
        options: ["Peixes Vivos", "Camarão", "Filé de Frango", "Coquinho"],
        correct: 0
    },
    {
        question: `Qual desses peixes é predador?`,
        img: ``,
        options: ["Tilápia", "Curimba", "Traíra", "Lambari"],
        correct: 2
    },
    {
        question: `Que rio da amazônia se destaca pela pescaria de peixes de couro?`,
        img: ``,
        options: ["Rio Xingu", "Rio Madeira", "Rio Negro", "Rio Orinoco"],
        correct: 1
    },
    {
        question: `A melhor isca para pegar piranhas é?`,
        img: ``,
        options: ["Carne", "Coquinho", "Peixes vivos", "Todas"],
        correct: 3
    },
    {
        question: `Como se chama este peixe?`,
        img: `<img src="./assets/peixequiz2.jpg">`,
        options: ["Surubim Pintado", "Surubim Cachara", "Surubim Caparari", "Jaú"],
        correct: 0
    },
    {
        question: `Qual desses peixes não é nativo do Brasil?`,
        img: ``,
        options: ["Cará", "Tilápia", "Pirarucu", "Aruanã"],
        correct: 1
    }
];

let currentQuestionIndex = 0;
let score = 0;

function loadQuestion() {
    const questionElement = document.getElementById('question');
    const options = document.querySelectorAll('.option');
    const questionImg = document.getElementById('questionImg');
    const currentQuestion = questions[currentQuestionIndex];
    
    questionElement.innerText = currentQuestion.question;
    questionElement.innerHTML += currentQuestion.img;
    options.forEach((option, index) => {
        option.innerText = currentQuestion.options[index];
    });
}

function selectAnswer(selectedIndex) {
    const currentQuestion = questions[currentQuestionIndex];
    
    if (selectedIndex === currentQuestion.correct) {
        score++;
    }
    
    document.getElementById('next-button').style.display = 'block';
}

function nextQuestion() {
    currentQuestionIndex++;
    
    if (currentQuestionIndex < questions.length) {
        loadQuestion();
        document.getElementById('next-button').style.display = 'none';
    } else {
        finishQuiz();
    }
}

function finishQuiz() {
    sendScoreToServer();
}

function sendScoreToServer() {
    fetch('usuarios/inserirPontuacao', {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          // crie um atributo que recebe o valor recuperado aqui
          // Agora vá para o arquivo routes/usuario.js
          id:sessionStorage.ID_USUARIO,
          pontos: score,
        }),
    }).then(function (resposta) {
        console.log("resposta: ", resposta);

        if (resposta.ok) {

            quiz.style.display = "none";
            resultado.style.display = "flex"

            if(score >= 0 && score < 4){
                resultado.innerHTML = `<h1>Você fez ${score} pontos 😒</h1> <br>
                <p>Tá precisando pescar mais!<p>`;
            }else if(score >=4 && score <=6){
                resultado.innerHTML = `<h1>Você fez ${score} pontos 😐</h1> <br>
                <p>Dá pra melhorar!<p>`;
            }else if(score >=7 && score <=9){
                resultado.innerHTML = `<h1>Você fez ${score} pontos 😊</h1> <br>
                <p>Boaaa pescador!<p>`;
            }else if(score == 10){
                resultado.innerHTML = `<h1>Você fez ${score} pontos 😁</h1> <br>
                <p>Parabéns! Você sabe muito sobre pescaria!<p>`;
            }
            resultado.innerHTML += ``// chart aqui
          
        } else {
          throw "Houve um erro ao tentar realizar o cadastro!";
        }
      })
      .catch(function (resposta) {
        console.log(`#ERRO: ${resposta}`);
      });
}

document.addEventListener('DOMContentLoaded', () => {
    loadQuestion();
});