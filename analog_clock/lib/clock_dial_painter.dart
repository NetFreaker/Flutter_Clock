import 'dart:math';

import 'package:flutter/material.dart';

class ClockDialPainter extends CustomPainter{
  final clockText;
  final hourTickMarkLength= 10.0;
  final minuteTickMarkLength = 5.0;

  final hourTickMarkWidth= 3.0;
  final minuteTickMarkWidth = 1.5;

  final Paint tickPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  final romanNumeralList= [ 'H','H', 'H', 'H', 'H', 'H', 'H', 'H', 'H', 'H', 'H', 'H'];

  ClockDialPainter({this.clockText= ClockText.roman})
      :tickPaint= new Paint(),
        textPainter= new TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle= const TextStyle(
          color: Colors.blueAccent,
          fontFamily: 'Sans',
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        )
  {
    tickPaint.color= Colors.blueGrey;
  }
  @override
  void paint(Canvas canvas, Size size) {
    //   var tickMarkLength;
    final angle= 2* pi / 60;
    final radius= size.height/2;
    canvas.save();

    // drawing
    canvas.translate(radius, radius);
    for (var i = 0; i< 60; i++ ) {

      //draw the text
      if (i%5==0){
        canvas.save();
        canvas.translate(0.0, -radius+10.0);

        textPainter.text= new TextSpan(
          text: this.clockText==ClockText.roman?
          '${romanNumeralList[i~/5]}'
              :'${i == 0 ? 12 : i~/5}'
          ,
          style: textStyle,
        );

        //helps make the text painted vertically
        canvas.rotate(-angle*i);

        textPainter.layout();


        textPainter.paint(canvas, new Offset(-(textPainter.width/2), -(textPainter.height/2)));

        canvas.restore();

      }

      canvas.rotate(angle);
    }

    canvas.restore();

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

enum ClockText{
  roman,
  arabic
}