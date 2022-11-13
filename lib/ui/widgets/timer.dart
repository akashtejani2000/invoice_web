import 'dart:developer';

import 'package:flutter/material.dart';

class TextTimer extends StatefulWidget {
  final Duration duration;
  final TextTimerController controller;
  final VoidCallback? onEnd;
  final TextStyle? textStyle;

  const TextTimer({required this.duration, required this.controller, this.onEnd, this.textStyle});

  @override
  _TextTimerState createState() => _TextTimerState();
}

class _TextTimerState extends State<TextTimer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    widget.controller._state = this;
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0,
      upperBound: widget.duration.inSeconds.toDouble(),
    )..addStatusListener((status) {
        log(status.toString());
        if (status == AnimationStatus.dismissed) widget.onEnd?.call();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Text(
          "${(_controller.value ~/ 60).toString().padLeft(2, "0")}"
          ":${(_controller.value % 60).toInt().toString().padLeft(2, "0")}",
        );
      },
    );
  }
}

class TextTimerController {
  late _TextTimerState _state;

  void start() {
    _state._controller.reverse(from: _state.widget.duration.inSeconds.toDouble());
  }

  void reset() {
    _state._controller.reset();
  }
}
