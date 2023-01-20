import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:test_kama/task_1/game.dart';
import 'package:test_kama/task_1/helpers/speed_btn.dart';

class Task1Page extends StatelessWidget {
  const Task1Page({
    Key? key,
    required this.game,
  }) : super(key: key);
  final Task1Game game;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Задача 1'),
        ),
        body: Stack(
          children: [
            GameWidget(game: game),
            Align(
              alignment: Alignment.bottomCenter,
              child: SpeedBtn(onSpeedChanged: game.onKeySpeedChanged),
            )
          ],
        ),
      );
  }
}
