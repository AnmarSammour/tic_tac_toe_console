import 'dart:io';
import 'dart:math';
import 'Board.dart';
import 'Player.dart';

class TwoPlayersGame {
  late Player player1;
  late Player player2;
  Board board = Board();
  int player1Wins = 0;
  int player2Wins = 0;

  TwoPlayersGame(String name1, String name2) {

    //Choose a random player to assign symbols
    List<Player> players = [Player(name1, ''), Player(name2, '')];
    players.shuffle();
    player1 = players[0];
    player2 = players[1];
    
    //Random player selection
    print('${player1.name}, you are randomly chosen.');

    //Player1 chooses X or O
    chooseSymbol(player1);

    //Player2 gets the opposite symbol
    player2.symbol = (player1.symbol == 'X') ? 'O' : 'X';

    print(
        '${player1.name} is ${player1.symbol} and ${player2.name} is ${player2.symbol}.');

    //Determine which player will start
    if (player2.symbol == 'X') {
      
      //Swap players so that the 'X' player always starts
      Player temp = player1;
      player1 = player2;
      player2 = temp;
    }

    print('${player1.name} will start first.');
  }

  void chooseSymbol(Player player) {
    print('${player.name}, do you want to be X or O?');
    String symbolChoice = stdin.readLineSync()!.toUpperCase();

    // This message appears if the player chose an error code
    while (symbolChoice != 'X' && symbolChoice != 'O') {
      print('Invalid choice. Please enter either X or O.');
      symbolChoice = stdin.readLineSync()!.toUpperCase();
    }

    player.symbol = symbolChoice;
  }

  void startGame() {
    bool currentPlayer = Random().nextBool();

    while (!board.checkWin() && !board.isBoardFull()) {
      board.printBoard();

      Player currentPlayerObj = currentPlayer ? player1 : player2;
      String symbol = currentPlayerObj.symbol;

      int move = getPlayerMove(currentPlayerObj);
      if (board.isCellEmpty(move)) {
        board.makeMove(move, symbol);
        currentPlayer = !currentPlayer;
      } else {
        print('Invalid move, try again.');
      }
    }

    board.printBoard();

    if (board.checkWin()) {
      Player winner = currentPlayer ? player2 : player1;
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

  void updateScores(bool currentPlayer) {
    if (currentPlayer) {
      player2Wins++;
    } else {
      player1Wins++;
    }
  }

  void printResults() {
    print('${player1.name} $player1Wins, ${player2.name} $player2Wins');
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
