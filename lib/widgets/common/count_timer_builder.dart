import 'dart:async';

import 'package:flutter/material.dart';

typedef TimerBuilder = Widget Function(BuildContext context,
    {String day, String hour, String minute, String second, int time});

class CountTimer extends StatefulWidget {
  final int second;
  final TimerBuilder? timerBuilder;
  final VoidCallback? countdownEnd;
  CountTimer(this.second, {this.timerBuilder, this.countdownEnd});
  @override
  _CountTimerState createState() => _CountTimerState();
}

class _CountTimerState extends State<CountTimer> {
  int _second = 0;
  Timer? _timer;

  @override
  void initState() {
    _second = widget.second;
    super.initState();
    if (_second != 0) {
      initTimer();

      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        _second = _second - 1;
        if (_second == -1) {
          _timer?.cancel();
          _timer = null;
          _second = 0;
          countdownEnd();
        } else {
          initTimer();
        }
      });
    }
  }

  void countdownEnd() {
    widget.countdownEnd?.call();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  initTimer() {
    if (mounted) {
      setState(() {});
    }
  }

  String transData(int data) {
    return data < 10 ? '0$data' : '$data';
  }

  @override
  Widget build(BuildContext context) {
    int day = _second ~/ (3600 * 24);
    int hour = _second % (3600 * 24) ~/ 3600;
    int minute = _second % 3600 ~/ 60;
    int second = _second <= 0 ? 0 : _second % 60;
    return widget.timerBuilder!(context,
        day: transData(day),
        hour: transData(hour),
        minute: transData(minute),
        second: transData(second),
        time: _second);
  }
}
