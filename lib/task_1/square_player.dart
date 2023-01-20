import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:test_kama/task_1/helpers/speed_enum.dart';

class SquarePlayer extends PositionComponent {
  static final _paint = Paint()..color = Colors.white;

  SpeedEnum speed = SpeedEnum.stop;

  late Vector2 _sizeScreen;

  set sizeScreen(Vector2 position) => _sizeScreen = position;
  bool isBack = false;


  @override
  void update(double dt) {
    super.update(dt);
    updatePosition(dt);
  }

  updatePosition(double dt) {


    switch (speed) {
      case SpeedEnum.one:
      case SpeedEnum.two:
      case SpeedEnum.three:
      case SpeedEnum.four:
        _speedDirection(speed: speed.value);
        break;
      case SpeedEnum.stop:
        position.x = _sizeScreen.x / 2;
        isBack = false;
        break;
    }
  }

  void _speedDirection({required int speed}) {
    if (isBack) {
      position.x -= speed;
      isBack = !(position.x < 0);
    } else {
      position.x += speed;
      isBack = position.x > _sizeScreen.x;
    }
    return;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), _paint);
  }
}
