import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ice_cream_generator/ice_cream_constants.dart';

class PolkaDots {
  late int _radius;
  late int _startX;
  late int _startY;
  late Color _color;

  int get radius => _radius;
  int get startX => _startX;
  int get startY => _startY;
  Color get color => _color;

  PolkaDots() {
    Random random = Random();

    _radius = Random().nextInt(11) + 5;
    _startX = -Random().nextInt(25) - 90;
    _startY = Random().nextInt(20) + 15;
    _color = IceCreamConstants
        .scoopColors[random.nextInt(IceCreamConstants.scoopColors.length)];
  }
}
