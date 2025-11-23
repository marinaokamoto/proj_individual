var database = require("../database/config");

function registrarGeneros (fkUsuario, generoMais, generoMenos) {
console.log("ACESSEI O QUIZ MODEL \n \n\t\t >> Se aqui der erro de 'Error: connect ECONNREFUSED',\n \t\t >> verifique suas credenciais de acesso ao banco\n \t\t >> e se o servidor de seu BD está rodando corretamente. \n\n function registrar(): ", fkUsuario, generoMais, generoMenos);
    var instrucaoSql = `
        INSERT INTO Resultado (fkQuiz, fkUsuario, generoMais, generoMenos) VALUES (1, '${fkUsuario}', '${generoMais}', '${generoMenos}');
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    registrarGeneros
};