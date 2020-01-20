import 'dart:async';

import 'package:flutter_clock_helper/model.dart';
import 'package:flutter/material.dart';
import 'clock_dial_painter.dart';
import 'clock_face.dart';

typedef TimeProducer = DateTime Function();

class AnalogClock extends StatefulWidget {
  @override
  _AnalogClockState createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new ClockBody(),

          ],
        ),
      ),
    );
  }
}


class ClockBody extends StatefulWidget {
  final ClockModel model;
  final ClockText clockText;
  final TimeProducer getCurrentTime;
  final Duration updateDuration;

  const ClockBody({this.model,
    this.clockText = ClockText.arabic,
    this.getCurrentTime = getSystemTime,
    this.updateDuration = const Duration(seconds: 1)});

  static DateTime getSystemTime() {
    return new DateTime.now();
  }

  @override
  _ClockBodyState createState() => _ClockBodyState();
}

class _ClockBodyState extends State<ClockBody> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    this._timer = new Timer.periodic(widget.updateDuration, setTime);
  }

  void setTime(Timer timer) {
    setState(() {
      dateTime = new DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
        aspectRatio: 1.6,
        child: new Stack(alignment: Alignment.center, children: <Widget>[
          new Container(
            // color: Colors.black,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: new ClockFace(
              clockText: widget.clockText,
              dateTime: dateTime,
            ),
          ),
        ]));
  }
}