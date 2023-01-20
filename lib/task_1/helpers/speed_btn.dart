import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:test_kama/task_1/helpers/speed_enum.dart';

/// {@template speed_btn}
/// SpeedBtn widget
/// {@endtemplate}
class SpeedBtn extends StatefulWidget {
  /// {@macro speed_btn}
  const SpeedBtn({super.key, this.onSpeedChanged});

  final ValueChanged<SpeedEnum>? onSpeedChanged;

  @override
  State<SpeedBtn> createState() => _SpeedBtnState();
}

/// State for widget SpeedBtn
class _SpeedBtnState extends State<SpeedBtn> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void didUpdateWidget(SpeedBtn oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Widget configuration changed
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The configuration of InheritedWidgets has changed
    // Also called after initState but before build
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  SpeedEnum speed = SpeedEnum.stop;
  void updateSpeed(SpeedEnum newSpeed) {
    speed = newSpeed;
    widget.onSpeedChanged!(speed);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => updateSpeed(SpeedEnum.one),
                child: const Text('1'),
              ),
              ElevatedButton(
                onPressed: () => updateSpeed(SpeedEnum.two),
                child: const Text('2'),
              ),
              ElevatedButton(
                onPressed: () => updateSpeed(SpeedEnum.three),
                child: const Text('3'),
              ),
              ElevatedButton(
                onPressed: () => updateSpeed(SpeedEnum.four),
                child: const Text('4'),
              )
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(child: const Text('stop'), onPressed: () => updateSpeed(SpeedEnum.stop)),
          )
        ],
      ),
    );
  }
}
