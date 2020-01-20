import 'package:analog_clock_example/clock_hands.dart';
import 'package:flutter/material.dart';

import 'clock_dial_painter.dart';


class ClockFace extends StatelessWidget {
  final DateTime dateTime;
  final ClockText clockText;

  ClockFace({this.clockText = ClockText.arabic, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: new Padding(
        padding: const EdgeInsets.all(5.0),
        child: new AspectRatio(
          aspectRatio: 1.0,
          child: new Container(
            width: double.infinity,
            decoration: new BoxDecoration(
              shape: BoxShape.rectangle,
            ),

            child: new Stack(
              children: <Widget>[
                new ClockHands(),
                new Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: new CustomPaint(
                    painter: new ClockDialPainter(clockText: ClockText.roman),
                  ),
                ),
                //clock hands go here
              ],
            ),
          ),

        ),
      ),
    );
  }
}
