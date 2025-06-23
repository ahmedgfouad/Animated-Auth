import 'package:animated_auth/core/theme/colors.dart';
import 'package:animated_auth/feature/home/presentation/view/widget/bottom_sheet_content_widget.dart';
import 'package:flutter/material.dart';

class AnimatedBottomSheetContent extends StatefulWidget {
  const AnimatedBottomSheetContent({super.key});

  @override
  State<AnimatedBottomSheetContent> createState() =>
      AnimatedBottomSheetContentState();
}

class AnimatedBottomSheetContentState extends State<AnimatedBottomSheetContent>
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
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.appColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: BottomSheetContentWidget(),
      ),
    );
  }
}
