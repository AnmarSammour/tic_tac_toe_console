import 'dart:io';

import 'AIGame.dart';
import 'TwoPlayersGame.dart';

void main() {

//Choose How to Play
  print('The way of playing :');
  print('1. Tow player');
  print('2. With AI');

  String? choice;
  while (choice != '1' && choice != '2') {
    print('Please enter 1 or 2:');
    choice = stdin.readLineSync()!;
  }

  switch (choice) {
    case '1':
      print('Enter player 1 name:');
      String name1 = stdin.readLineSync()!;
      print('Enter player 2 name:');
      String name2 = stdin.readLineSync()!;
      TwoPlayersGame game = TwoPlayersGame(name1, name2);
      game.startGame();
      break;
    case '2':
      print('Enter your name:');
      String playerName = stdin.readLineSync()!;
      String aiName = 'ai';
      AIGame aiGame = AIGame(playerName, aiName);
      aiGame.startGame();
      break;

    default:
      print('Invalid choice');
      break;
  }
}
