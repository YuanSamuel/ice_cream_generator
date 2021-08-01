import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ice_cream_generator/models/ConeType.dart';
import 'package:ice_cream_generator/models/CupType.dart';
import 'package:ice_cream_generator/models/IceCream.dart';
import 'package:ice_cream_generator/models/ScoopType.dart';
import 'package:ice_cream_generator/models/ToppingsType.dart';

class IceCreamPainter extends CustomPainter {
  late final IceCream iceCream;

  IceCreamPainter({required this.iceCream});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    if (iceCream.coneType == ConeType.Cone) {
      drawCone(canvas, center);
    } else {
      drawCup(canvas, center);
    }
    if (iceCream.scoopType == ScoopType.Scoop) {
      drawScoop(canvas, center);
    } else {
      drawSwirl(canvas, center);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawScoop(Canvas canvas, Offset center) {
    Paint border = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint fill = Paint()..style = PaintingStyle.fill;

    Rect bottom = Rect.fromCenter(center: center, width: 200, height: 100);
    Rect top = Rect.fromCenter(center: center, width: 200, height: 200);

    for (int i = 0; i < iceCream.numScoops; i++) {
      fill..color = iceCream.scoopColors[i];
      canvas.drawArc(bottom, pi, -pi, true, border);
      canvas.drawArc(top, pi, pi, true, border);
      canvas.drawArc(bottom, pi, -pi, true, fill);
      canvas.drawArc(top, pi, pi, true, fill);
      bottom = bottom.translate(0, -60);
      top = top.translate(0, -60);
    }

    if (iceCream.toppingsType == ToppingsType.Syrup) {
      drawSyrup(canvas, top);
    } else if (iceCream.toppingsType == ToppingsType.Sprinkles) {
      drawSprinkles(canvas, top);
    }

    Paint clearFill = Paint()
      ..color = ThemeData.light().scaffoldBackgroundColor
      ..style = PaintingStyle.fill;

    top = top.translate(0, 60);
    double cx = (top.right + top.left) / 2;
    double cy = (top.top + top.bottom) / 2;
    Rect topClearRect =
        Rect.fromCenter(center: Offset(cx, cy), width: 206, height: 206);
    Path topClear = Path()
      ..arcTo(topClearRect, pi, pi, false)
      ..lineTo(cx + 102, cy - 180)
      ..lineTo(cx - 102, cy - 180)
      ..lineTo(cx - 104, cy);

    canvas.drawPath(topClear, clearFill);
  }

  void drawSyrup(Canvas canvas, Rect top) {
    Path syrup1 = Path()
      ..moveTo(top.left + 20, top.top + 100)
      ..quadraticBezierTo(
          top.left + 30, top.top + 200, top.left + 35, top.top + 84);
    Path syrup2 = Path()
      ..moveTo(top.left + 55, top.top + 71)
      ..quadraticBezierTo(
          top.left + 65, top.top + 260, top.left + 70, top.top + 65);
    Path syrup3 = Path()
      ..moveTo(top.left + 90, top.top + 60)
      ..quadraticBezierTo(
          top.left + 100, top.top + 300, top.left + 105, top.top + 60);
    Path syrup4 = Path()
      ..moveTo(top.left + 125, top.top + 65)
      ..quadraticBezierTo(
          top.left + 130, top.top + 260, top.left + 140, top.top + 71);
    Path syrup5 = Path()
      ..moveTo(top.left + 160, top.top + 80)
      ..quadraticBezierTo(
          top.left + 170, top.top + 200, top.left + 175, top.top + 93);

    Paint syrupPaint = Paint()
      ..color = iceCream.syrupColor
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawPath(syrup1, syrupPaint);
    canvas.drawPath(syrup2, syrupPaint);
    canvas.drawPath(syrup3, syrupPaint);
    canvas.drawPath(syrup4, syrupPaint);
    canvas.drawPath(syrup5, syrupPaint);
  }

  void drawSprinkles(Canvas canvas, Rect top) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    double cx = (top.left + top.right) / 2;
    double cy = (top.top + top.bottom) / 2;

    //canvas.drawRect(top, paint);
    canvas.save();
    canvas.translate(cx, cy);
    for (int i = 0; i < iceCream.sprinkles.length; i++) {
      canvas.rotate(iceCream.sprinkles[i].rotation);
      paint..color = iceCream.sprinkles[i].color;
      canvas.drawRRect(iceCream.sprinkles[i].shape, paint);
    }

    canvas.translate(-cx, -cy);
    canvas.restore();
    // canvas.drawRect(Rect.fromLTRB(10, 10, 100, 100), paint);
    // canvas.drawRRect(rect, paint);
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

    Paint cupFill = Paint()
      ..color = iceCream.cupColor
      ..style = PaintingStyle.fill;

    Paint whiteFill = Paint()
      ..color = ThemeData.light().scaffoldBackgroundColor
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

    canvas.drawPath(path, cupFill);

    if (iceCream.cupType == CupType.Dots) {
      drawDots(canvas, center);
    } else if (iceCream.cupType == CupType.Stripes) {
      drawStripes(canvas, center);
    }

    Rect rightClear = Rect.fromLTRB(
        center.dx - 140, center.dy, center.dx - 102, center.dy + 200);
    Rect leftClear = Rect.fromLTRB(
        center.dx + 102, center.dy, center.dx + 140, center.dy + 200);
    Rect bottomClearRect = Rect.fromCenter(
        center: Offset(center.dx, center.dy + 126), width: 205, height: 100);
    Path bottomClear = Path()
      ..arcTo(bottomClearRect, pi, -pi, false)
      ..lineTo(center.dx + 102, center.dy + 200)
      ..lineTo(center.dx - 102, center.dy + 200)
      ..lineTo(center.dx - 102, center.dy + 125);

    canvas.drawRect(rightClear, whiteFill);
    canvas.drawRect(leftClear, whiteFill);
    canvas.drawPath(bottomClear, whiteFill);

    canvas.drawPath(path, blackBorder);
  }

  void drawDots(Canvas canvas, Offset center) {
    Paint fill = Paint()
      ..color = iceCream.polkaDots.color
      ..style = PaintingStyle.fill;

    int radius = iceCream.polkaDots.radius;
    int startX = iceCream.polkaDots.startX;
    int startY = iceCream.polkaDots.startY;

    bool alt = false;
    for (int x = startX; x < 125; x += (radius * 2.5).round()) {
      for (int y = startY + (alt ? (radius * 1.1).round() : 0);
          y < 175;
          y += (radius * 2.5).round()) {
        canvas.drawCircle(
            Offset(center.dx + x, center.dy + y), radius.toDouble(), fill);
      }
      alt = !alt;
    }
  }

  void drawStripes(Canvas canvas, Offset center) {
    Paint fill = Paint()..style = PaintingStyle.fill;

    int index = 0;
    for (int x = -90; x <= 70; x += 40) {
      fill
        ..color =
            iceCream.stripes.colors[index % iceCream.stripes.colors.length];

      Rect stripe = Rect.fromLTRB(center.dx + x.toDouble(), center.dy,
          center.dx + x.toDouble() + 20, center.dy + 200);

      canvas.drawRect(stripe, fill);

      index++;
    }
  }

  void drawSwirl(Canvas canvas, Offset center) {
    Paint blackBorder = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    Paint fill = Paint()
      ..color = iceCream.scoopColors[0]
      ..style = PaintingStyle.fill;

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
      ..arcTo(swirl6, -pi / 6, -pi / 3, false)
      ..arcTo(swirl7, -2 * pi / 3, 2 * pi / 3, false)
      ..quadraticBezierTo(
          center.dx + 30, center.dy - 110, center.dx - 68, center.dy - 104);

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
