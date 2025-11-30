var quizModel = require("../models/quizModel") //indicando o próximo arqv no caminho dos dados, no caso rota>controller>model

function registrar(req, res) {
    var fkUsuario = req.body.idUsuarioServer;
    var generoMais = req.body.generoMaisServer;
    var generoMenos = req.body.generoMenosServer;
    var pontuacao = req.body.pontuacaoServer;

    quizModel.registrarGeneros(fkUsuario, generoMais, generoMenos, pontuacao)
        .then(
            function (resultado) {
                res.json(resultado);
            }
        )
        .catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao registrar: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    registrar,
};

