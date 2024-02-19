import 'package:flutter/material.dart';
import 'package:xo_game_app/player_screen.dart';
import 'borad_button.dart';

class GameBoardScreen extends StatefulWidget {
  static String routeName = 'game_board';
  const GameBoardScreen({super.key});
  @override
  State<GameBoardScreen> createState() => _GameBoardScreenState();
}
class _GameBoardScreenState extends State<GameBoardScreen> {
  List<String> boardState = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  int player1Score = 0;
  int player2Score = 0;
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'XO Game',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      '${args.player1Name} (x)',
                      style:
                          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$player1Score',
                      style:
                          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      '${args.player2Name} (O)',
                      style:
                          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$player2Score',
                      style:
                          const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoradButton(
                  text: boardState[0],
                  onButtonClick: onButtonClick,
                  index: 0,
                ),
                BoradButton(
                    text: boardState[1],
                    onButtonClick: onButtonClick,
                    index: 1),
                BoradButton(
                    text: boardState[2],
                    onButtonClick: onButtonClick,
                    index: 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoradButton(
                    text: boardState[3],
                    onButtonClick: onButtonClick,
                    index: 3),
                BoradButton(
                    text: boardState[4],
                    onButtonClick: onButtonClick,
                    index: 4),
                BoradButton(
                    text: boardState[5],
                    onButtonClick: onButtonClick,
                    index: 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BoradButton(
                    text: boardState[6],
                    onButtonClick: onButtonClick,
                    index: 6),
                BoradButton(
                    text: boardState[7],
                    onButtonClick: onButtonClick,
                    index: 7),
                BoradButton(
                  text: boardState[8],
                  onButtonClick: onButtonClick,
                  index: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;

  void onButtonClick(int index) {
    if (boardState[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardState[index] = 'X';
    } else {
      boardState[index] = 'O';
    }
    counter++;
    if (checkWinner('X')) {
      player1Score += 5;
      initBoard();
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text('Player X Wins!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      });
    }else if(checkWinner('O')){
      player2Score += 5;
      initBoard();
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: const Text('Player O Wins!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      });
    }else if(counter == 9){
      initBoard();
    }
    setState(() {});
  }

  bool checkWinner(String symbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardState[i] == symbol &&
          boardState[i + 1] == symbol &&
          boardState[i + 2] == symbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardState[i] == symbol &&
          boardState[i + 3] == symbol &&
          boardState[i + 6] == symbol) {
        return true;
      }
    }
    if (boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if (boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }
    return false;
  }

  void initBoard() {
    boardState = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
    setState(() {});
  }
}
