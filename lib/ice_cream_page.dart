import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ice_cream_generator/ice_cream_painter.dart';

class IceCreamPage extends StatefulWidget {
  const IceCreamPage({Key? key}) : super(key: key);

  @override
  _IceCreamPageState createState() => _IceCreamPageState();
}

class _IceCreamPageState extends State<IceCreamPage> {
  late int _scoopType;
  late int _coneType;

  @override
  void initState() {
    _scoopType = Random().nextInt(2);
    _coneType = Random().nextInt(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
              painter: IceCreamPainter(
                scoopType: _scoopType,
                coneType: _coneType,
              ),
              child: Container(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _scoopType = Random().nextInt(2);
                        _coneType = Random().nextInt(2);
                      });
                    },
                    child: Text(
                      'Generate Ice Cream!',
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
