import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:ice_cream_generator/ice_cream_constants.dart';

class Stripes {
  late List<Color> _colors;

  List<Color> get colors => _colors;

  Stripes() {
    Random random = Random();
    int length = random.nextInt(5) + 1;
    _colors = <Color>[];
    for (int i = 0; i < length; i++) {
      _colors.add(IceCreamConstants
          .cupColors[random.nextInt(IceCreamConstants.cupColors.length)]);
    }
  }
}
