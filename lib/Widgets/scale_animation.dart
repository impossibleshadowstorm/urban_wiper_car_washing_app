import 'package:flutter/material.dart';

class ScaleAnimation extends StatefulWidget {
  final int duration;
  final Widget child;
  final bool direction;

  const ScaleAnimation({
    required this.duration,
    required this.direction,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  _ScaleAnimationState createState() => _ScaleAnimationState();
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScaleAnimation oldWidget) {
    if (oldWidget.direction != widget.direction) {
      animationController
        ..forward()
        ..addListener(() {
          setState(() {});
        });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: widget.direction ? 1 : 0,
      duration: Duration(milliseconds: widget.duration),
      child: Transform.scale(
        scale: widget.direction && animationController.value == 0.0
            ? 1
            : animationController.value,
        child: widget.child,
      ),
    );
  }
}