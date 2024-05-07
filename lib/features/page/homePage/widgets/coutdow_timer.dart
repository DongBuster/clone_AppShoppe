import 'dart:async';
import 'package:flutter/material.dart';

class CountdownTimer extends StatefulWidget {
  final int seconds;
  const CountdownTimer({super.key, required this.seconds});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer>
    with TickerProviderStateMixin {
  late int secondsRemaining;
  late Timer timer;
  late final controller = AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    secondsRemaining = widget.seconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int hours = (secondsRemaining / 3600).floor();
    int minutes = ((secondsRemaining % 3600 / 60)).floor();
    int seconds = (secondsRemaining % 60);

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds).toString().padLeft(2, '0');

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //--- hours
        Container(
          alignment: Alignment.center,
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(3)),
          child: Text(hoursStr,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 3, right: 3),
          child: const Text(
            ':',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        //--- minutes
        Container(
          alignment: Alignment.center,
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(3)),
          child: Text(minutesStr,
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 3, right: 3),
          child: const Text(
            ':',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        //--- seconds
        Container(
          alignment: Alignment.center,
          width: 25,
          height: 25,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(3)),
          child: Text(
            secondsStr,
            style: const TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
