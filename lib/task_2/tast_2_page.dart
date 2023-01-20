import 'dart:async';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:test_kama/task_2/custom_btn.dart';
import 'package:test_kama/task_2/empty_page.dart';

class Task2Page extends StatefulWidget {
  const Task2Page({
    Key? key,
  }) : super(key: key);

  @override
  State<Task2Page> createState() => _Task2PageState();
}

class _Task2PageState extends State<Task2Page> {
  final _listNumberBtn = [1, 2, 3, 4];
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задача 2'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomBtn(
                    onPressed: _handleClick,
                    numberBtn: _listNumberBtn[0],
                  ),
                  CustomBtn(
                    onPressed: _handleClick,
                    numberBtn: _listNumberBtn[1],
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomBtn(
                    onPressed: _handleClick,
                    numberBtn: _listNumberBtn[2],
                  ),
                  CustomBtn(
                    onPressed: _handleClick,
                    numberBtn: _listNumberBtn[3],
                  )
                ],
              )
            ]),
          ),
          Visibility(
            visible: _isVisible,
            child: Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SizedBox(height: size.height * 0.2, child: Lottie.asset('assets/lottie/electric-car.json')),
            ),
          )
        ],
      ),
    );
  }

  void _handleClick(int numberBtn) {
    switch (numberBtn) {
      case 1:
        _showDialogNextPage();
        break;
      case 2:
        setState(() {
          _isVisible = !_isVisible;
        });
        break;
      case 3:
        setState(() {
          _listNumberBtn.shuffle();
        });
        break;
      case 4:
        _showDialogExitApp();
        break;
    }
  }

  Future<void> _showDialogExitApp() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Вы дествительно хотите выйти из приложения?'),
          actions: <Widget>[
            TextButton(
              child: const Text('да'),
              onPressed: () {
                SystemNavigator.pop();
              },
            ),
            TextButton(
              child: const Text('нет'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogNextPage() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Открыть пустую сцену?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('вывод посередине экрана окна с текстом и двумя кнопками "переход "отмена". "Переход" загружает другую пустую сцену.'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Переход'),
              onPressed: () {
                     Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EmptyPage()),
                );
              },
            ),
            TextButton(
              child: const Text('Отмена'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
