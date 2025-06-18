
import 'package:flutter/material.dart';

class AnimatedBottomSheetContent extends StatefulWidget {
  const AnimatedBottomSheetContent({super.key});

  @override
  State<AnimatedBottomSheetContent> createState() =>
      AnimatedBottomSheetContentState();
}

class AnimatedBottomSheetContentState
    extends State<AnimatedBottomSheetContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ); 
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text("Hello from Bottom Sheet!", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text("You can add your custom content here."),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
