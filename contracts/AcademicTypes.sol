// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


struct Aluno{
    uint id;
    string nome;
    address aluno;
}

struct Disciplina{
    uint id;
    string nome;
    address professor; 
}

struct Nota{
    uint idDisciplina;
    uint idAluno;
    uint valor;
}

enum Periodo {
    INSCRICAO_ALUNOS,
    LANCAMENTO_NOTAS
}


