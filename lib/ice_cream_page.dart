import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ice_cream_generator/ice_cream_painter.dart';
import 'package:ice_cream_generator/models/IceCream.dart';

class IceCreamPage extends StatefulWidget {
  const IceCreamPage({Key? key}) : super(key: key);

  @override
  _IceCreamPageState createState() => _IceCreamPageState();
}

class _IceCreamPageState extends State<IceCreamPage> {
  late IceCream _iceCream;

  @override
  void initState() {
    _iceCream = new IceCream();
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
                iceCream: _iceCream,
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
                        _iceCream = new IceCream();
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
