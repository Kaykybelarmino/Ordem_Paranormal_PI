var express = require("express");
var router = express.Router();


var fichaController = require("../controllers/fichaController");
//definir para 
router.get("/listarParticipantes", function (req, res) {
    fichaController.listarParticipantes(req, res);
} ); 

router.post("/criarFicha", function (req, res) {
    fichaController.editarPersonagem(req, res);
} );


module.exports = router  ;