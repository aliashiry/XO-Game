import 'package:flutter/material.dart';
import 'package:xo_game_app/player_screen.dart';

import 'game_board_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute:PlayerScreen.routeName,
      routes: {
        GameBoardScreen.routeName: (context) =>  const GameBoardScreen(),
        PlayerScreen.routeName: (context) =>  PlayerScreen()
      },
    );
  }
}
