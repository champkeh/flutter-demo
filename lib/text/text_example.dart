import 'package:flutter/material.dart';

class TextExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hello Flutter It is Awesome WOW',
            textAlign: TextAlign.right,
            textDirection: TextDirection.ltr,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
              color: Colors.black,
              fontSize: 50,
              fontWeight: FontWeight.w200,
              letterSpacing: 2,
              wordSpacing: 40,
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.wavy,
            ),
          ),
        ],
      ),
    );
  }
}
