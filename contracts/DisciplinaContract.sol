// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./AcademicTypes.sol";
import "./Academic.sol";
import "./AlunoContract.sol";
import "./IDisciplinaContract.sol";

contract DisciplinaContract is IDisciplinaContract {

    mapping(uint => Disciplina) DisciplinaById;

    address owner;

    address private _academicContractAddr;

    modifier onlyOwner(){
       require(msg.sender == owner, "Nao autorizado");
       _;
    }

   modifier onlyProfessor(uint disciplinaId){
       Disciplina memory d = disciplinaById[disciplinaId];
       require(d.professor != address(0), "Disciplina sem professor");
       require(msg.sender == d.professor, "Nao autorizado");
       _;
   }
    constructor(address academicContractAddr){
       _academicContractAddr = academicContractAddr;
       owner = msg.sender;
    }

    function getDisciplinaById(uint id) public view override returns (Disciplina memory){
        return DisciplinaById[id];
    }

    function inserirDisciplina(uint id, string memory nome, address addressProfessor) onlyOwner public override {
       require(Academic(_academicContractAddr).etapa() == Periodo.INSCRICAO_ALUNOS, "Fora do periodo de inscricao de aluno");
       DisciplinaById[id] = Disciplina(id, nome, addressProfessor);
    }
    
    function inserirAlunoDisciplina(uint disciplinaId, uint alunoId) onlyProfessor public{
      require(bytes(IAlunoContract(_alunoContractAddr).getAlunoById(alunoId).nome).length != 0, "Aluno nao encontrado");
      inscritosDisciplinaById[disciplinaId].push(alunoId);
    }

    function myPrivateFuncion() private {
    }
    


}

