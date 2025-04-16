// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TicTacToe {
    address public playerX;
    address public playerO;
    address public currentPlayer;
    bool public gameActive;

    uint8[9] public board; // 0 - empty, 1 - X, 2 - O

    constructor(address _playerO) {
        playerX = msg.sender;
        playerO = _playerO;
        currentPlayer = playerX;
        gameActive = true;
    }

    function makeMove(uint8 index) external {
        require(gameActive, "Game over");
        require(msg.sender == currentPlayer, "Not your turn");
        require(index < 9, "Invalid index");
        require(board[index] == 0, "Cell taken");

        board[index] = currentPlayer == playerX ? 1 : 2;

        if (checkWin(currentPlayer == playerX ? 1 : 2)) {
            gameActive = false;
        } else if (isBoardFull()) {
            gameActive = false;
        } else {
            currentPlayer = currentPlayer == playerX ? playerO : playerX;
        }
    }

    function checkWin(uint8 player) internal view returns (bool) {
        uint8[8][3] memory winPatterns = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // cols
            [0, 4, 8], [2, 4, 6]             // diagonals
        ];

        for (uint8 i = 0; i < winPatterns.length; i++) {
            uint8[3] memory pattern = winPatterns[i];
            if (board[pattern[0]] == player &&
                board[pattern[1]] == player &&
                board[pattern[2]] == player) {
                return true;
            }
        }
        return false;
    }

    function isBoardFull() internal view returns (bool) {
        for (uint8 i = 0; i < 9; i++) {
            if (board[i] == 0) {
                return false;
            }
        }
        return true;
    }

    function getBoard() external view returns (uint8[9] memory) {
        return board;
    }

    function getCurrentPlayer() external view returns (address) {
        return currentPlayer;
    }
}
