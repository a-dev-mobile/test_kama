import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:test_kama/task_1/helpers/speed_enum.dart';
import 'package:test_kama/task_1/square_player.dart';

class Task1Game extends FlameGame {
  final SquarePlayer _squarePlayer = SquarePlayer();
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _squarePlayer.sizeScreen = size;
    _squarePlayer.position = size / 2;
    _squarePlayer.width = 25;
    _squarePlayer.height = 25;
    _squarePlayer.anchor = Anchor.center;
    add(_squarePlayer);
  }

  onKeySpeedChanged(SpeedEnum speed) {
    print(speed.name);
    _squarePlayer.speed = speed;
  }
}
