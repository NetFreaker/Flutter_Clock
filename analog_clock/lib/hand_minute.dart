import 'dart:math';

import 'package:flutter/material.dart';


class MinuteHandPainter extends CustomPainter {
  final Paint minuteHandPaint;
  int minutes;
  int seconds;

  MinuteHandPainter({this.minutes, this.seconds})
      :minuteHandPaint= new Paint() {
    minuteHandPaint.color = Colors.white;
    minuteHandPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);

    canvas.rotate(2 * pi * ((this.minutes + (this.seconds / 60)) / 60));

    Path path = new Path();

    path.moveTo(-1.0, -radius - -5.0);
    path.lineTo(-1.0, -radius / 1.0);
    path.lineTo(-1.0, 10.0);
    path.lineTo(1.0, 10.0);
    path.lineTo(1.0, -radius / 1.0);
    path.lineTo(1.0, -radius - -5.0);
    path.close();

    canvas.drawPath(path, minuteHandPaint);
//    canvas.drawShadow(path, Colors.white, 4.0, false);


    canvas.restore();
  }

  @override
  bool shouldRepaint(MinuteHandPainter oldDelegate) {
    return true;
  }
}