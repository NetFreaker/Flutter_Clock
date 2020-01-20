import 'dart:math';

import 'package:flutter/material.dart';


class HourHandPainter extends CustomPainter {
  final Paint hourHandPaint;
  int hours;
  int minutes;

  HourHandPainter({this.hours, this.minutes}) :hourHandPaint= new Paint() {
    hourHandPaint.color = Colors.white;
    hourHandPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    // To draw hour hand
    canvas.save();

    canvas.translate(radius, radius);

    //checks if hour is greater than 12 before calculating rotation
    canvas.rotate(this.hours >= 12 ?
    2 * pi * ((this.hours - 12) / 12) :
    2 * pi * ((this.hours / 12))
    );


    Path path = new Path();
    path.addOval(
        new Rect.fromCircle(radius: 10.0, center: new Offset(0.0, -radius)));
    path.addOval(
        new Rect.fromCircle(radius: 5.0, center: new Offset(0.0, 0.0)));
    path.close();

    canvas.drawPath(path, hourHandPaint);
//  canvas.drawShadow(path, Colors.white, 2.0, false);


    canvas.restore();
  }

  @override
  bool shouldRepaint(HourHandPainter oldDelegate) {
    return true;
  }
}