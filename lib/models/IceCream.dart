import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ice_cream_generator/ice_cream_constants.dart';
import 'package:ice_cream_generator/models/ConeType.dart';
import 'package:ice_cream_generator/models/PolkaDots.dart';
import 'package:ice_cream_generator/models/ScoopType.dart';

class IceCream {
  late ConeType _coneType;
  late ScoopType _scoopType;
  late int _numScoops;
  late bool _hasSyrup;
  late PolkaDots _polkaDots;
  late List<Color> _scoopColors;
  late Color _cupColor;
  late Color _syrupColor;

  ConeType get coneType => _coneType;
  ScoopType get scoopType => _scoopType;
  int get numScoops => _numScoops;
  bool get hasSyrup => _hasSyrup;
  PolkaDots get polkaDots => _polkaDots;
  List<Color> get scoopColors => _scoopColors;
  Color get cupColor => _cupColor;
  Color get syrupColor => _syrupColor;

  IceCream() {
    Random random = Random();

    int holdNum = random.nextInt(2);
    if (holdNum == 0) {
      _coneType = ConeType.Cone;
    } else {
      _coneType = ConeType.Cup;
    }

    holdNum = random.nextInt(2);
    if (holdNum == 0) {
      _scoopType = ScoopType.Scoop;
    } else {
      _scoopType = ScoopType.Swirl;
    }

    _numScoops = random.nextInt(3) + 1;

    _hasSyrup = random.nextInt(2) == 1;

    _polkaDots = new PolkaDots();

    _scoopColors = <Color>[];
    for (int i = 0; i < _numScoops; i++) {
      _scoopColors.add(IceCreamConstants
          .scoopColors[random.nextInt(IceCreamConstants.scoopColors.length)]);
    }

    _cupColor = IceCreamConstants
        .scoopColors[random.nextInt(IceCreamConstants.scoopColors.length)];

    _syrupColor = IceCreamConstants
        .syrupColors[random.nextInt(IceCreamConstants.syrupColors.length)];
  }
}
