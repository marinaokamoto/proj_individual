var database = require("../database/config");

function buscarUltimosResultados() {

    var instrucaoSql = 
    `SELECT 
    generoMais AS genero,
    COUNT(*) / (SELECT COUNT(*) FROM Resultado) *100 AS porcentagem
    FROM Resultado
    GROUP BY generoMais;`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function grafico2(idUsuario) {

    var instrucaoSql = 
    `SELECT 
	generoMais as genero,
	COUNT(*) AS qtd
    FROM Resultado
    WHERE fkUsuario = ${idUsuario}
    GROUP BY generoMais;`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimosResultados,
    grafico2,
}