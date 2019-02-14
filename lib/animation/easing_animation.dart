import 'package:flutter/material.dart';

class EasingAnimationWidget extends StatefulWidget {
  @override
  _EasingAnimationWidgetState createState() => _EasingAnimationWidgetState();
}

class _EasingAnimationWidgetState extends State<EasingAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  void handler(status) {
    if (status == AnimationStatus.completed) {
      _animation.removeStatusListener(handler);
      _controller.reset();
      _animation = Tween(begin: 0, end: 1).animate(
          CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            Navigator.pop(context);
          }
        });
      _controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    _animation = Tween(begin: -1, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn))
      ..addStatusListener(handler);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
          body: Transform(
            transform:
                Matrix4.translationValues(_animation.value * width, 0, 0),
            child: Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.black12,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class AlignmentAnimationRoute extends StatefulWidget {
  @override
  _AlignmentAnimationRouteState createState() =>
      _AlignmentAnimationRouteState();
}

class _AlignmentAnimationRouteState extends State<AlignmentAnimationRoute>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    AlignmentTween _tween = AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    CurveTween _curve = CurveTween(curve: Curves.easeOut)
        .chain(CurveTween(curve: Curves.bounceOut))
        .chain(CurveTween(curve: Curves.elasticIn))
        .chain(CurveTween(curve: Interval(0.2, 0.8, curve: Curves.bounceOut)));

    _tween.chain(_curve);

    _animation = _controller.drive(AlignmentTween(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    )
        .chain(CurveTween(curve: Curves.bounceOut))
        .chain(CurveTween(curve: Curves.easeIn)));

    _animation = TweenSequence<Alignment>([
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
        ).chain(CurveTween(curve: Curves.easeIn)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: ConstantTween(Alignment.topRight),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ).chain(CurveTween(curve: Curves.bounceOut)),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: ConstantTween(Alignment.bottomRight),
        weight: 10,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(
          begin: Alignment.bottomRight,
          end: Alignment.bottomLeft,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
    ]).animate(_controller);

    _animation.addListener(() {
      print(_animation);
    });

//    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget child) {
            return Container(
              child: Align(
                alignment: _animation.value,
                child: child,
              ),
            );
          },
          child: SizedBox(
            width: 50,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
            ),
          ),
        ),
        Center(
          child: RaisedButton(
            onPressed: () {
              print(_controller);
              _controller.reset();
              _controller.forward();
            },
            child: Text('Play'),
            color: Colors.deepOrange,
            colorBrightness: Brightness.dark,
          ),
        ),
      ],
    );
  }
}
