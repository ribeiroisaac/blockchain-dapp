// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

import "./AcademicTypes.sol";

interface IDisciplinaContract{
    function inserirDisciplina(uint id, string memory name, address professor) external;
    function getDisciplinaById(uint id) external view returns (Disciplina memory);
    function inserirAlunoDisciplina(uint disciplinaId, uint alunoId) external;
}