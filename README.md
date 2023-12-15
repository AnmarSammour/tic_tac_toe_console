# Tic-Tac-Toe Console Game

## Overview
This simple Tic-Tac-Toe game depends on the console and is implemented in Dart, the game allows you to play in two ways either against a person or against an AI opponent, the game features a simple interface and provides an enjoyable gaming experience.

## How to Run
Follow these steps to run the Tic-Tac-Toe game on your machine:

1. Ensure that you have Dart installed. If not, you can download it from [Dart SDK](https://dart.dev/get-dart).
2. Clone this repository to your local machine:
    ```bash
    git clone https://github.com/AnmarSammour/tic_tac_toe_console
    ```
3. Navigate to the project directory:

    ```bash
    cd tic-tac-toe-console
    ```
4. Run the game:

    ```bash
    dart bin/main.dart
    ```

# Tic-Tac-Toe Console Game

## Gameplay Instructions

### First, Choose Gameplay:

1. **Two Players:**
   - Enter your name and your opponent's name.
   - Players are randomly assigned 'X' or 'O'.
   - The player selected with 'X' starts first.
   - Make moves by entering the box number.

2. **With AI:**
   - Play against the artificial intelligence.
   - Enter your name and choose 'X' or 'O'.
   - Make moves by entering the box number.

### Game Flow:

- For Two Players:
  - The game ends when one player wins or it's a tie.
  - After each game, you can choose to play again or exit.

- Against AI:
  - The game ends when either the player or the AI wins.
  - After each game, you can choose to play again or exit.

### Example Gameplay:

1. **Two Players:**
    ```plaintext
    First Player, enter your name: Player1
    Second Player, enter your name: Player2
    Player1 is randomly assigned 'X', and Player2 is 'O'.
    Player1, you start first.

     1 | 2 | 3 
    ---+---+---
     4 | 5 | 6 
    ---+---+---
     7 | 8 | 9 

    Player1, enter the number of the square to place your 'X': 5

     1 | 2 | 3 
    ---+---+---
     4 | X | 6 
    ---+---+---
     7 | 8 | 9 

    ...

    Player1 wins! (or It's a tie!)

    Player1: 1, Player2: 0

    Do you want to play again? (yes/no): yes
    ```

2. **With AI:**
    ```plaintext
    Enter your name: Player1
    Player1, do you want to be X or O? O
    Player1 is 'O', and AI is 'X'.

     1 | 2 | 3 
    ---+---+---
     4 | 5 | 6 
    ---+---+---
     7 | 8 | 9 

    Player1, enter the number of the square to place your 'O': 5

     1 | 2 | 3 
    ---+---+---
     4 | O | 6 
    ---+---+---
     7 | 8 | 9 

    ...

    Player1 wins! (or AI wins!)

    Player1: 1, AI: 0

    Do you want to play again? (yes/no): no
    ```

Enjoy the game!
