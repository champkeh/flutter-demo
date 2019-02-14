import 'package:flutter/material.dart';

class StackDemo extends StatefulWidget {
  @override
  _StackDemoState createState() => _StackDemoState();
}

class _StackDemoState extends State<StackDemo> {
  String _operation = "No Gesture detected!";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        height: 150,
        child: Text(
          _operation,
          style: TextStyle(color: Colors.white),
        ),
      ),
      onTap: () => setState(() => _operation = "Tap"),
      onDoubleTap: () => setState(() => _operation = "DoubleTap"),
      onLongPress: () => setState(() => _operation = "LongPress"),
    );
  }
}

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> with SingleTickerProviderStateMixin {
  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(
              child: Text('A'),
            ),
            onPanDown: (event) {
              print("用户手指按下: ${event.globalPosition}");
            },
            onPanEnd: (event) {
              print(event.velocity);
            },
            onPanUpdate: (event) {
//              _left += event.delta.dx;
              _top += event.delta.dy;
              setState(() {});
            },
          ),
        )
      ],
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = Tween(begin: 0.0, end: 300.0).animate(animation)
      ..addListener(() => setState(() => {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/images/image-demo.jpg',
        width: animation.value,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class BounceAnimationRoute extends StatefulWidget {
  @override
  _BounceAnimationRouteState createState() => _BounceAnimationRouteState();
}

class _BounceAnimationRouteState extends State<BounceAnimationRoute>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut);
    animation = Tween(begin: 420.0, end: 0.0).animate(animation)
      ..addListener(() => setState(() => {}));
    Future.delayed(Duration(seconds: 2), () => controller.forward());
//    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/image-demo.jpg'),
        Positioned(
          bottom: animation.value,
          left: 100,
          child: CircleAvatar(
            child: Text('A'),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class HeroAnimationRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(pageBuilder: (BuildContext context,
                Animation animation, Animation secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('原图'),
                  ),
                  body: HeroAnimationRouteB(),
                ),
              );
            }),
          );
        },
        child: Hero(
          tag: 'avatar',
          child: CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/image-demo.jpg'),
          ),
        ),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'avatar',
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image-demo.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    // 高度动画
    height = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.ease),
      ),
    );

    // 颜色动画
    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, curve: Curves.ease),
      ),
    );

    // 位移动画
    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: 0),
      end: EdgeInsets.only(left: 100),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1.0, curve: Curves.ease),
      ),
    );
  }

  final Animation<double> controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomLeft,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildAnimation,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
  }

  Future<Null> _playAnimation() async {
    try {
      // 先正向执行动画
      await controller.forward().orCancel;
      // 再反向执行动画
      await controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _playAnimation();
      },
      child: Center(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            border: Border.all(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          child: StaggerAnimation(
            controller: controller,
          ),
        ),
      ),
    );
  }
}
