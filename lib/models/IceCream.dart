import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ice_cream_generator/ice_cream_constants.dart';
import 'package:ice_cream_generator/models/ConeType.dart';
import 'package:ice_cream_generator/models/CupType.dart';
import 'package:ice_cream_generator/models/PolkaDots.dart';
import 'package:ice_cream_generator/models/ScoopType.dart';
import 'package:ice_cream_generator/models/Stripes.dart';

class IceCream {
  late ConeType _coneType;
  late ScoopType _scoopType;
  late CupType _cupType;
  late int _numScoops;
  late bool _hasSyrup;
  late PolkaDots _polkaDots;
  late Stripes _stripes;
  late List<Color> _scoopColors;
  late Color _cupColor;
  late Color _syrupColor;

  ConeType get coneType => _coneType;
  ScoopType get scoopType => _scoopType;
  CupType get cupType => _cupType;
  int get numScoops => _numScoops;
  bool get hasSyrup => _hasSyrup;
  PolkaDots get polkaDots => _polkaDots;
  Stripes get stripes => _stripes;
  List<Color> get scoopColors => _scoopColors;
  Color get cupColor => _cupColor;
  Color get syrupColor => _syrupColor;

  IceCream() {
    Random random = Random();

    int holdNum = random.nextInt(4);
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

    holdNum = random.nextInt(3);
    if (holdNum == 0) {
      _cupType = CupType.None;
    } else if (holdNum == 1) {
      _cupType = CupType.Dots;
    } else {
      _cupType = CupType.Stripes;
    }

    _numScoops = random.nextInt(3) + 1;

    _hasSyrup = random.nextInt(2) == 1;

    _polkaDots = new PolkaDots();

    _stripes = new Stripes();

    _scoopColors = <Color>[];
    for (int i = 0; i < _numScoops; i++) {
      _scoopColors.add(IceCreamConstants
          .scoopColors[random.nextInt(IceCreamConstants.scoopColors.length)]);
    }

    _cupColor = IceCreamConstants
        .cupColors[random.nextInt(IceCreamConstants.cupColors.length)];

    _syrupColor = IceCreamConstants
        .syrupColors[random.nextInt(IceCreamConstants.syrupColors.length)];
  }
}
