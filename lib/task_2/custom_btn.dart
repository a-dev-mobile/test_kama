import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({
    Key? key,
    required this.numberBtn,
    this.onPressed,
  }) : super(key: key);

  final int numberBtn;
  final void Function(int btn)? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () => onPressed!(numberBtn),
        child: Text('Кнопка №$numberBtn'),
      ),
    );
  }
}
