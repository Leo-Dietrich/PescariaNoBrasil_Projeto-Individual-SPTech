const questions = [
    {
        question: `Qual o nome do peixe:`,
        imgUrl: `<img scr="./assets/peixequiz.png">`,
        options: ["Tilápia", "Pirarucu", "Dourado", "Pacu"],
        correct: 0
    },
    {
        question: `Qual das iscas a seguir NÃO é boa para tucunaré?`,
        imgUrl: ``,
        options: ["Artificiais", "Lambari", "Camarão", "Massas"],
        correct: 3
    },
    {
        question: `Qual o maior peixe de água doce do Brasil?`,
        imgUrl: ``,
        options: ["Jaú", "Piraíba", "Pirarucu", "Piau"],
        correct: 1
    },
    {
        question: `Como se chama este tipo de isca? `,
        imgUrl: `<img src="./assets/isca1.png">`,
        options: ["Plug/Meia água", "Jig/Peninha", "Popper", "Zara/Lápis"],
        correct: 1
    },
    {
        question: `Qual a isca ideal para Pirarara?`,
        imgUrl: ``, 
        options: ["Peixes Vivos", "Camarão", "Filé de Frango", "Coquinho"],
        correct: 0
    },
    {
        question: `Qual peixe brasileiro é o mais pescado no país?`,
        imgUrl: ``,
        options: ["Tilápia", "Tucunaré", "Traíra", "Lambari"],
        correct: 2
    },
    {
        question: `Que rio da amazônia se destaca pela pescaria de peixes de couro?`,
        imgUrl: ``,
        options: ["Rio Xingu", "Rio Madeira", "Rio Negro", "Rio Orinoco"],
        correct: 1
    },
    {
        question: `A melhor isca para pegar piranhas é?`,
        imgUrl: ``,
        options: ["Carne", "Coquinho", "Peixes vivos", "Todas"],
        correct: 3
    },
    {
        question: `Como se chama esse peixe?`,
        imgUrl: `<img scr="./assets/peixequiz2.jpg">`,
        options: ["Pintado", "Cachara", "Caparari", "Jaú"],
        correct: 0
    }
    // {
    //     question: ``,
    //     options: ["", "", "", ""],
    //     correct: 0
    // },
];

let currentQuestionIndex = 0;
let score = 0;

function loadQuestion() {
    const questionElement = document.getElementById('question');
    const options = document.querySelectorAll('.option');
    const questionImg = document.getElementById('questionImg');
    const currentQuestion = questions[currentQuestionIndex];
    
    questionElement.innerText = currentQuestion.question;
    questionElement.innerHTML += currentQuestion.imgUrl;
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

            //resposta para pontuacao
          
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