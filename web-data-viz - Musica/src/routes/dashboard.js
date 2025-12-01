var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

//Recebendo os dados do html e direcionando para a função registrar de quizController.js
router.get("/grafico1", function (req, res) {
    dashboardController.buscarUltimosResultados(req, res);
});

router.get("/grafico2/:idUsuario", function (req, res) {
    dashboardController.grafico2(req, res);
});

router.get("/ranking", function (req, res) {
    dashboardController.ranking(req,res);
});

router.get("/selos/:idUsuario", function (req, res) {
    dashboardController.selos(req, res);
});


module.exports = router;