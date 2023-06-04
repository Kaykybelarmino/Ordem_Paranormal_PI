var express = require("express");
var router = express.Router();


var sessaoController = require("../controllers/sessaoController");

router.post("/adicionarTurno", function (req, res) {
    sessaoController.adicionarTurno(req, res);
} ); 

router.post("/editarPersonagem", function (req, res) {
    sessaoController.editarPersonagem(req, res);
} );

router.get("/listarTurnos", function (req, res) {
    sessaoController.listarTurnos(req, res);
} );

router.get("/listarPersonagens", function (req, res) {
    sessaoController.listarPersonagens(req, res);
}  );

module.exports = router  ;