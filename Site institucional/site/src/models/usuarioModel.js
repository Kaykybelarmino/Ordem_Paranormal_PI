var database = require("../database/config")

function listar() {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function listar()");
    var instrucao = `
        SELECT * FROM usuario;
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

function entrar(email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function entrar(): ", email, senha)
    var instrucao = `
        SELECT * FROM Mestre WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

// Coloque os mesmos parâmetros aqui. Vá para a var instrucao
function cadastrar(nome, email, senha) {
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrar():", nome, email, senha);
    
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucao = `
        INSERT INTO Mestre (nome, email, senha) VALUES ('${nome}', '${email}', '${senha}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

//  usuarioModel.cadastrarSessao(nomeSessao, prefacioSessao, nomeParticipante, nomePersonagem, urlImagem).then(
    
function cadastrarSessao(nomeSessao, prefacioSessao, emailMestre){
    console.log("ACESSEI O USUARIO MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function cadastrarSessao():", nomeSessao, prefacioSessao);


    var instrucaoCadastrarSessao = `
            INSERT INTO sessao (nome, dtSessao, sinopse, fkMestre)
            VALUES ('${nomeSessao}', now(), '${prefacioSessao}',  (
                SELECT id
                FROM mestre
                WHERE email = '${emailMestre}'
            )); 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoCadastrarSessao);
    return database.executar(instrucaoCadastrarSessao);
    
     
}

function cadastrarParticipante(prefacioSessao, nomeParticipante, idSessao){

    var instrucao = `
    INSERT INTO participante (nome, fkSessao)
    VALUES ('${nomeParticipante}', (
        SELECT sessao.id
        FROM sessao
        JOIN mestre ON mestre.id = sessao.fkMestre
        WHERE sessao.id = ${idSessao}
    ));
      
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);


} 

function listarDadosSessao(sinopseSessao){ 
    var instrucao = `
        SELECT * 
        FROM sessao JOIN mestre ON mestre.id = sessao.fkMestre;
    `;

    console.log("Executando a instrução SQL: \n" + instrucao);
    return database.executar(instrucao);
}

module.exports = {
    entrar,
    cadastrar,
    listar,
    cadastrarSessao,
    cadastrarParticipante, 
    listarDadosSessao
};