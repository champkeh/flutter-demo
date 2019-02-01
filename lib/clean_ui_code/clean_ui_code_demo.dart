import 'package:flutter/material.dart';

class CleanUICodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clean You UI Code'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('First line of text.'),
            const SizedBox(height: 8),
            Text('Second line of text.'),
            const SizedBox(height: 8),
            Text('Third line of text.'),
          ],
        ),
      ),
    );
  }
}
