// sessão
function validarSessao() {
    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;
    var primeiroNome = '';

    var spanUser = document.getElementById("spanUser");

    if (email != undefined && nome != undefined) {
        for (let i = 0; i < nome.length; i++) {
            primeiroNome += nome[i];
            if(nome[i+1] == ' '){
                break
            }
        }
        divLogcad.style ="display: none"
        divBemvindo.style ="display: flex"
        spanUser.innerHTML = primeiroNome;

    } else {
        divLogcad.style ="display: flex"
        divBemvindo.style ="display: none"
    }
}

function limparSessao() {
    sessionStorage.clear();
    window.location.reload(true);
}

function abrirPorta(){
    porta.classList.remove("fa-door-closed")
    porta.classList.add("fa-door-open")
}
function fecharPorta(){
    porta.classList.remove("fa-door-open")
    porta.classList.add("fa-door-closed")
}

