import 'dart:math';

import 'package:flutter/material.dart';

class IceCreamPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    drawCup(canvas, center);
    // drawCone(canvas, center);
    // drawScoop(canvas, center);
    drawSwirl(canvas, center);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawScoop(Canvas canvas, Offset center) {
    Paint border = Paint()
      ..color = Colors.pink.shade100
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint fill = Paint()
      ..color = Colors.pink.shade100
      ..style = PaintingStyle.fill;

    Rect bottom = Rect.fromCenter(center: center, width: 200, height: 100);
    Rect top = Rect.fromCenter(center: center, width: 200, height: 200);

    canvas.drawArc(top, pi, pi, true, border);
    canvas.drawArc(bottom, pi, -pi, true, fill);
    canvas.drawArc(top, pi, pi, true, fill);
  }

  void drawCone(Canvas canvas, Offset center) {
    Paint brownBorder = Paint()
      ..color = Colors.brown
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint brownBorderThin = Paint()
      ..color = Colors.brown
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint brownFill = Paint()
      ..color = Colors.brown.shade300
      ..style = PaintingStyle.fill;

    Paint whiteFill = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromCenter(center: center, width: 200, height: 100);

    Path path = Path()
      ..moveTo(center.dx - 100, center.dy)
      ..lineTo(center.dx, center.dy + 300)
      ..lineTo(center.dx + 100, center.dy)
      ..close();
    canvas.drawPath(path, brownBorder);
    canvas.drawPath(path, brownFill);

    canvas.drawLine(Offset(center.dx - 20, center.dy + 240),
        Offset(center.dx + 10, center.dy + 270), brownBorderThin);
    canvas.drawLine(Offset(center.dx - 40, center.dy + 180),
        Offset(center.dx + 20, center.dy + 240), brownBorderThin);
    canvas.drawLine(Offset(center.dx - 60, center.dy + 120),
        Offset(center.dx + 30, center.dy + 210), brownBorderThin);
    canvas.drawLine(Offset(center.dx - 80, center.dy + 60),
        Offset(center.dx + 40, center.dy + 180), brownBorderThin);
    canvas.drawLine(Offset(center.dx - 100, center.dy),
        Offset(center.dx + 50, center.dy + 150), brownBorderThin);
    canvas.drawLine(Offset(center.dx - 60, center.dy),
        Offset(center.dx + 60, center.dy + 120), brownBorderThin);
    canvas.drawLine(Offset(center.dx - 20, center.dy),
        Offset(center.dx + 70, center.dy + 90), brownBorderThin);
    canvas.drawLine(Offset(center.dx + 20, center.dy),
        Offset(center.dx + 80, center.dy + 60), brownBorderThin);

    canvas.drawLine(Offset(center.dx + 20, center.dy + 240),
        Offset(center.dx - 10, center.dy + 270), brownBorderThin);
    canvas.drawLine(Offset(center.dx + 40, center.dy + 180),
        Offset(center.dx - 20, center.dy + 240), brownBorderThin);
    canvas.drawLine(Offset(center.dx + 60, center.dy + 120),
        Offset(center.dx - 30, center.dy + 210), brownBorderThin);
    canvas.drawLine(Offset(center.dx + 80, center.dy + 60),
        Offset(center.dx - 40, center.dy + 180), brownBorderThin);
    canvas.drawLine(Offset(center.dx + 100, center.dy),
        Offset(center.dx - 50, center.dy + 150), brownBorderThin);
    canvas.drawLine(Offset(center.dx + 60, center.dy),
        Offset(center.dx - 60, center.dy + 120), brownBorderThin);
    canvas.drawLine(Offset(center.dx + 20, center.dy),
        Offset(center.dx - 70, center.dy + 90), brownBorderThin);
    canvas.drawLine(Offset(center.dx - 20, center.dy),
        Offset(center.dx - 80, center.dy + 60), brownBorderThin);

    canvas.drawArc(rect, pi, -pi, true, whiteFill);
    canvas.drawArc(rect, pi, -pi, true, brownBorder);
  }

  void drawCup(Canvas canvas, Offset center) {
    Paint blackBorder = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint blueFill = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Rect top = Rect.fromCenter(center: center, width: 200, height: 100);
    Rect bottom = Rect.fromCenter(
        center: Offset(center.dx, center.dy + 125), width: 200, height: 100);

    Path path = Path()
      ..moveTo(center.dx - 100, center.dy)
      ..arcTo(top, pi, -pi, false)
      ..lineTo(center.dx + 100, center.dy + 125)
      ..arcTo(bottom, 0, pi, false)
      ..lineTo(center.dx - 100, center.dy)
      ..close();

    // ..lineTo(center.dx, center.dy + 300)
    // ..lineTo(center.dx + 100, center.dy)
    // ..close();

    canvas.drawPath(path, blueFill);
    canvas.drawPath(path, blackBorder);
  }

  void drawSwirl(Canvas canvas, Offset center) {
    Paint blackBorder = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint border = Paint()
      ..color = Colors.pink.shade100
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint fill = Paint()
      ..color = Colors.pink.shade100
      ..style = PaintingStyle.fill;

    Rect swirl1 = Rect.fromCenter(
        center: Offset(center.dx + 90, center.dy - 20), width: 40, height: 60);
    Rect swirl2 = Rect.fromCenter(
        center: Offset(center.dx - 90, center.dy - 30), width: 30, height: 50);
    Rect swirl3 = Rect.fromCenter(
        center: Offset(center.dx + 75, center.dy - 55), width: 30, height: 50);
    Rect swirl4 = Rect.fromCenter(
        center: Offset(center.dx - 85, center.dy - 80), width: 20, height: 40);
    Rect swirl5 = Rect.fromCenter(
        center: Offset(center.dx + 67, center.dy - 100), width: 20, height: 40);
    Rect swirl6 = Rect.fromCenter(
        center: Offset(center.dx - 90, center.dy - 55), width: 50, height: 200);
    Rect swirl7 = Rect.fromCenter(
        center: Offset(center.dx - 40, center.dy - 117),
        width: 174,
        height: 90);

    Rect bottom = Rect.fromCenter(center: center, width: 200, height: 100);

    // canvas.drawArc(bottom, 0, 2 * pi, false, fill);
    Path path = Path()
      ..quadraticBezierTo(
          center.dx + 50, center.dy - 25, center.dx - 100, center.dy)
      ..arcTo(swirl2, pi / 2, pi, true)
      ..quadraticBezierTo(
          center.dx + 50, center.dy - 70, center.dx + 80, center.dy - 93)
      ..arcTo(swirl3, -pi / 2, pi, false);

    Path path1 = Path()
      ..arcTo(bottom, pi, -pi - pi / 5, false)
      ..quadraticBezierTo(
          center.dx + 50, center.dy - 15, center.dx - 100, center.dy);

    Path path2 = Path()
      ..arcTo(swirl2, pi / 2, pi, false)
      ..quadraticBezierTo(
          center.dx + 50, center.dy - 70, center.dx + 75, center.dy - 80)
      ..arcTo(swirl3, -pi / 2, pi, false)
      ..quadraticBezierTo(
          center.dx + 50, center.dy - 15, center.dx - 90, center.dy - 4);

    Path path3 = Path()
      ..arcTo(swirl4, pi / 2, pi, false)
      ..quadraticBezierTo(
          center.dx + 50, center.dy - 110, center.dx + 67, center.dy - 120)
      ..arcTo(swirl5, -pi / 2, pi, false)
      ..quadraticBezierTo(
          center.dx + 50, center.dy - 70, center.dx - 84, center.dy - 59);

    Path path4 = Path()
    ..arcTo(swirl6, -pi / 6, - pi / 3, false)
    ..arcTo(swirl7, -2 * pi / 3, 2 * pi / 3, false)
    ..quadraticBezierTo(center.dx + 30, center.dy - 110, center.dx - 68, center.dy - 104);

    // canvas.drawArc(swirl4, -pi / 2, -pi, false, border);
    // canvas.drawLine(Offset(center.dx - 75, center.dy - 100),
    //     Offset(center.dx + 70, center.dy - 131), border);
    // canvas.drawArc(swirl5, -pi / 2, pi, false, border);
    // canvas.drawArc(swirl6, -pi / 2, pi / 3, false, border);
    // canvas.drawArc(swirl7, -2 * pi / 3, 2 * pi / 3, false, border);

    canvas.drawPath(path1, blackBorder);
    canvas.drawPath(path1, fill);
    canvas.drawPath(path2, blackBorder);
    canvas.drawPath(path2, fill);
    canvas.drawPath(path3, blackBorder);
    canvas.drawPath(path3, fill);
    canvas.drawPath(path4, blackBorder);
    canvas.drawPath(path4, fill);
  }
}
