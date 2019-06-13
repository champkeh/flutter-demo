import 'package:flutter/material.dart';
import 'package:flutter_demo/animation/stagger_animation.dart';
import 'package:flutter/rendering.dart';

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
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: double.infinity,
            minWidth: 100,
            maxHeight: 200,
            minHeight: 100,
          ),
          child: Stingy(
            child: RaisedButton(
              child: Text('Hello there...'),
              onPressed: () {
                print('It\'s been so long');
              },
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

class Stingy extends SingleChildRenderObjectWidget {
  Stingy({Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderStingy();
  }
}

class RenderStingy extends RenderShiftedBox {
  RenderStingy() : super(null);

  @override
  void performLayout() {
    child.layout(
        BoxConstraints(
          minHeight: 0,
          maxHeight: constraints.minHeight,
          minWidth: 0,
          maxWidth: constraints.minWidth,
        ),
        parentUsesSize: true);

    final BoxParentData childParentData = child.parentData;
    childParentData.offset = Offset(
        this.constraints.maxWidth - child.size.width,
        this.constraints.maxHeight - child.size.height);
    size = Size(this.constraints.maxWidth, constraints.maxHeight);
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Home extends StatefulWidget {
  @override
  HomeState createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
