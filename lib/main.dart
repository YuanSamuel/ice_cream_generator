import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ice_cream_generator/ice_cream_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      home: IceCreamPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
