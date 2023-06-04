var sessaoModel = require("../models/sessaoModel");


function listarPersonagens(req, res) {

    let idSessao = req.params.id
    sessaoModel.listarPersonagens(idSessao).then((response) => {
        console.log(JSON.stringify(response))
        res.status(200).json(response)
    }).catch((response) => {
        console.log(response)
        res.status(500).json(response)
    })
}


function adicionarTurno(req, res) {
    let personagem = req.body.personagem;
    let acao = req.body.acao;
    let id = req.body.idSessao;
    console.log(id + " ,+ id da sessao")
    sessaoModel.adicionarTurno(personagem, acao, id).then((response) => {
        console.log(JSON.stringify(response))
        res.status(200).json(response)
    }
    ).catch((response) => {
        console.log(response)
        res.status(500).json(response)
    }
    )

}

function listarTurnos(req, res) {

    let idSessao = req.params.id
    sessaoModel.listarTurnos(idSessao).then((response) => {
        console.log(JSON.stringify(response))
        res.status(200).json(response)
    }).catch((response) => {
        console.log(response)
        res.status(500).json(response)
    })
}

function editarTurno(req, res) {
    let id = req.body.idTurno;
    let sanidade = req.body.sanidade;
    let PE = req.body.PE;
    let vida = req.body.vida;
    sessaoModel.editarTurno(id, sanidade, PE, vida).then((response) => {
        console.log(JSON.stringify(response))
        res.status(200).json(response)
    }
    ).catch((response) => {
        console.log(response)
        res.status(500).json(response)
    }
    )
}
module.exports = {
    listarPersonagens,
    adicionarTurno, listarTurnos, editarTurno   
}