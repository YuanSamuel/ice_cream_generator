import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ice_cream_generator/ice_cream_constants.dart';

class Sprinkle {
  late Color _color;
  late double _rotation;
  late RRect _shape;

  Color get color => _color;
  double get rotation => _rotation;
  RRect get shape => _shape;

  Sprinkle() {
    Random random = Random();
    _color = IceCreamConstants.sprinkleColors[
        random.nextInt(IceCreamConstants.sprinkleColors.length)];

    _rotation = random.nextDouble();

    Rect rect = Rect.fromLTWH((random.nextDouble() - 0.5) * 140,
        (random.nextDouble() - 0.8) * 100, 5, 10);

    _shape = RRect.fromRectAndRadius(rect, Radius.circular(20));
  }
}
