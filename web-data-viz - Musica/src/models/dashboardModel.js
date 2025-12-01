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

function ranking() {
    var instrucaoSql = 
    `SELECT 
	u.nome as 'usuario',
    MAX(pontuacao) as 'pontuacao'
    FROM Usuario u
	JOIN Resultado r ON u.idUsuario = r.fkUsuario
    GROUP BY u.nome
    ORDER BY MAX(pontuacao) DESC LIMIT 4;`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function selos(idUsuario) {
    var instrucaoSql = 
    `SELECT
	DISTINCT generoMais
    FROM Resultado
    WHERE fkUsuario = ${idUsuario};`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimosResultados,
    grafico2,
    ranking,
    selos,
}