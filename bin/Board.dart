class Board {
  //Initialize the board with empty spaces
  List<String> board = List.filled(9, ' ');

  //Display the Tic-Tac-Toe board with proper formatting
  void printBoard() {
    print(' ${getValue(0)} | ${getValue(1)} | ${getValue(2)} ');
    print('---+---+---');
    print(' ${getValue(3)} | ${getValue(4)} | ${getValue(5)} ');
    print('---+---+---');
    print(' ${getValue(6)} | ${getValue(7)} | ${getValue(8)} ');
  }

  //Get the value of a cell, either the player's symbol or the cell number
  String getValue(int index) {
    return board[index] == ' ' ? (index + 1).toString() : board[index];
  }

  //Check if a cell is empty
  bool isCellEmpty(int index) {
    return board[index] == ' ';
  }

  //Check for win conditions: rows, columns, and diagonals
  bool checkWin() {
   
    //Check rows
    for (int i = 0; i < 3; i++) {
      if (board[i * 3] != ' ' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3] == board[i * 3 + 2]) {
        return true;
      }
    }

    //Check columns
    for (int i = 0; i < 3; i++) {
      if (board[i] != ' ' &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        return true;
      }
    }

    //Check diagonals (top-left to bottom-right)
    if (board[0] != ' ' &&
        board[0] == board[4] &&
        board[0] == board[8]) {
      return true;
    }

    //Check diagonals (top-right to bottom-left)
    if (board[2] != ' ' &&
        board[2] == board[4] &&
        board[2] == board[6]) {
      return true;
    }

    //No win
    return false;
  }

  //Check if the board is full (a draw)
  bool isBoardFull() {
    return !board.contains(' ');
  }

  //Make a move on the board
  void makeMove(int index, String symbol) {
    board[index] = symbol;
  }
}
