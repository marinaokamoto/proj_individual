var dashboardModel = require("../models/dashboardModel");

function buscarUltimosResultados(req, res) {

    dashboardModel.buscarUltimosResultados(req, res).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os últimos resultados.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function grafico2(req, res) {
var idUsuario = req.params.idUsuario;

    dashboardModel.grafico2(idUsuario).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os últimos resultados.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimosResultados,
    grafico2,
}