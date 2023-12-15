import 'dart:io';
import 'dart:math';
import 'Board.dart';
import 'Player.dart';

class AIGame {
  late Player player;
  late Player ai;
  Board board = Board();
  int playerWins = 0;
  int aiWins = 0;

  AIGame(String name, String symbol) {

    //Player chooses X or O
    player = Player(name, symbol);
    chooseSymbol(player);

    //AI gets the opposite symbol
    ai = Player('AI', (player.symbol == 'X') ? 'O' : 'X');

    print('${player.name} is ${player.symbol} and AI is ${ai.symbol}.');
  }

  void chooseSymbol(Player player) {
    print('${player.name}, do you want to be X or O?');
    String symbolChoice = stdin.readLineSync()!.toUpperCase();

    while (symbolChoice != 'X' && symbolChoice != 'O') {
      print('Invalid choice. Please enter either X or O.');
      symbolChoice = stdin.readLineSync()!.toUpperCase();
    }

    player.symbol = symbolChoice;
  }

  void startGame() {
    bool currentPlayer = (player.symbol == 'X'); // X starts first

    while (!board.checkWin() && !board.isBoardFull()) {
      board.printBoard();

      if (currentPlayer) {
        int move = getPlayerMove(player);
        if (board.isCellEmpty(move)) {
          board.makeMove(move, player.symbol);
        } else {
          print('Invalid move, try again.');
          continue;
        }
      } else {
        int move = getAIMove();
        board.makeMove(move, ai.symbol);
        print('AI chooses the box number: ${move + 1}');
      }

      currentPlayer = !currentPlayer; // Switch turn
    }

    board.printBoard();

    if (board.checkWin()) {
      Player winner = currentPlayer ? ai : player;
      print('${winner.name} wins!');
      updateScores(currentPlayer);
    } else {
      print('It\'s a draw!');
    }

    printResults();
    askToPlayAgain();
  }

  int getPlayerMove(Player player) {
    print(
        '${player.name}, please enter the number of the square where you want to place your ${player.symbol}:');
    String userInput = stdin.readLineSync()!;

    // Check if the input contains a valid integer
    if (RegExp(r'^[1-9]$').hasMatch(userInput)) {
      int move = int.parse(userInput);

      if (move < 1 || move > 9 || !board.isCellEmpty(move - 1)) {
        print(
            'Invalid move, please enter a number between 1 and 9 and choose an empty cell.');
        return getPlayerMove(player);
      }

      return move - 1;
    } else {
      print('Invalid input. Please enter a number between 1 and 9.');
      return getPlayerMove(player);
    }
  }

  int getAIMove() {
    List<int> emptyCells = [
      for (int i = 0; i < 9; i++)
        if (board.isCellEmpty(i)) i
    ];
    return emptyCells[Random().nextInt(emptyCells.length)];
  }

  void updateScores(bool currentPlayer) {
    if (currentPlayer) {
      aiWins++;
    } else {
      playerWins++;
    }
  }

  void printResults() {
    print('${player.name} $playerWins, AI $aiWins');
  }

  void askToPlayAgain() {
    print('Do you want to play again? (yes/no):');
    String playAgain = stdin.readLineSync()!.toLowerCase();

    if (playAgain == 'yes') {
      resetBoard();
      startGame();
    } else if (playAgain == 'no') {
      print('Goodbye!');
    } else {
      print('Invalid choice. Please enter yes or no.');
      askToPlayAgain();
    }
  }

  void resetBoard() {
    board = Board();
  }
}
