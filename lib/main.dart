import 'dart:async';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:test_kama/task_1/game.dart';

import 'package:test_kama/task_1/task_1_page.dart';
import 'package:test_kama/task_2/tast_2_page.dart';

@pragma('vm:entry-point')
void main([List<String>? args]) => runZonedGuarded<Future<void>>(() async {
      final Task1Game task = Task1Game();

      runApp(MaterialApp(home: App(game: task)));
    }, (error, stackTrace) {
      //Error.safeToString(error);
      //stackTrace.toString();
      log('error Zone>>> ', error: error, stackTrace: stackTrace);
    });

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.game,
  }) : super(key: key);
  final Task1Game game;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Task1Page(
                            game: game,
                          )),
                );
              },
              child: const Text('Задача 1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Task2Page()),
                );
              },
              child: const Text('Задача 2'),
            )
          ],
        ),
      ),
    );
  }
}
