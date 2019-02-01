import 'package:flutter/material.dart';
import 'package:flutter_demo/wavy_image_mask/wavy_header_image.dart';

class WavyImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wavy Image'),
      ),
      body: WavyHeaderImage(),
    );
  }
}
