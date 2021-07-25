import 'package:flutter/material.dart';
import 'package:ice_cream_generator/ice_cream_painter.dart';

class IceCreamPage extends StatelessWidget {
  const IceCreamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: IceCreamPainter(),
          child: Container(),
        ),
      ),
    );
  }
}
