import 'package:flutter/material.dart';
import 'package:flutter_demo/wavy_image_mask/wavy_image_demo.dart';
import 'package:flutter_demo/clean_ui_code/clean_ui_code_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CleanUICodePage(),
    );
  }
}
