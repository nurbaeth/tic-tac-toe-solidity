# 🎮 Tic Tac Toe in Solidity

A fully on-chain Tic Tac Toe game written in Solidity.  
No tokens, no rewards — just pure strategy between two players, right on the blockchain.

## 🚀 Features

- 👤 Two-player mode (X and O)
- ⛓️ On-chain game logic 
- ✅ Win, lose, or draw detection
- 🔐 Turn enforcement (no cheating!)
- 🧠 Simple and clean design

## 🛠️ How It Works

- The contract is deployed by **Player X**, who provides the address of **Player O**.
- Players take turns by calling `makeMove(index)` where `index` is a number from **0 to 8** representing the board position:

