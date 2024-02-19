import 'package:flutter/material.dart';

import 'game_board_screen.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = 'player-Screen';
  String player1Name = '';
  String player2Name = '';

  PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Welcome to  XO Game',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20,right: 8,left: 8,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             TextField(
              onChanged: (text){
                player1Name = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                labelText: 'Player 1',

              ),
            ),
            const SizedBox(
              height: 8,
            ),
             TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                labelText: 'Player 2',
              ),
              onChanged: (text){
                player2Name = text;
              },
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(3),
                      ),
                    ),
                    backgroundColor: Colors.blue,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(GameBoardScreen.routeName,arguments: GameBoardArgs(player1Name: player1Name, player2Name: player2Name));
                },
                child: const Text(
                  "Let's play",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
class GameBoardArgs{
  String player1Name ;
  String player2Name ;
  GameBoardArgs({required this.player1Name,required this.player2Name});
}