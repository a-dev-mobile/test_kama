
import 'package:flutter/material.dart';

/// {@template EmptyPage}
/// EmptyPage widget
/// {@endtemplate}
class EmptyPage extends StatelessWidget {
  /// {@macro EmptyPage}
  const EmptyPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Пустая сцена')),
        body: const Center(child: Text('Пустая сцена')),
      );
}