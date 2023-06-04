var database = require("../database/config")


function listarPersonagens(id ){
    let instrucao = `
    SELECT personagem.id, personagem.nome, urlImagem from personagem join sessao on fkSessao=sessao.id and sessao.id=1;`

    return database.executar(instrucao)
}

function adicionarTurno(personagem,acao, id ){ 
    let instrucao = `
    INSERT INTO turno (descAcao,dtHora,fkPersonagem, fkSessao) VALUES ('${acao}',now(),${personagem}, ${id});`

    return database.executar(instrucao)

}

function listarTurnos(id){ 
    let instrucao = `
    select turno.id, descAcao, dtHora, fkPersonagem, turno.fkSessao, sanidade, PE, vida, nome from turno join personagem on fkPersonagem=personagem.id; `

    return database.executar(instrucao)
}
module.exports = {
    listarPersonagens,
    adicionarTurno,
    listarTurnos

};