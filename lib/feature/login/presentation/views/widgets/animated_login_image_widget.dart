import 'package:animated_auth/core/utils/images.dart';
import 'package:flutter/material.dart';

class AnimatedLoginImageWidget extends StatefulWidget {
  const AnimatedLoginImageWidget({super.key});

  @override
  State<AnimatedLoginImageWidget> createState() =>
      _AnimatedLoginImageWidgetState();
}

class _AnimatedLoginImageWidgetState extends State<AnimatedLoginImageWidget>
    with SingleTickerProviderStateMixin {
  late final Animation<Offset> _slideAnimation;
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.01),
      end: const Offset(0, 0.01),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: Image.asset(
        AppImages.loginImg,
        height: 200,
        width: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
