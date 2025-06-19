import 'package:animated_auth/feature/home/presentation/view/widget/bottom_sheet_image_and_title_widget.dart';
import 'package:animated_auth/feature/home/presentation/view/widget/bottom_sheet_option_container_widget.dart';
import 'package:flutter/material.dart';


class BottomSheetOptionWidget extends StatefulWidget {
  const BottomSheetOptionWidget({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
  });

  final String text, image;
  final VoidCallback? onTap;

  @override
  State<BottomSheetOptionWidget> createState() =>
      _BottomSheetOptionWidgetState();
}

class _BottomSheetOptionWidgetState extends State<BottomSheetOptionWidget>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _slideController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation =
        Tween<Offset>(
          begin: const Offset(-0.02, 0),
          end: const Offset(0.02, 0),
        ).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeInOut),
        );

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.95,
      upperBound: 1.0,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.easeInOut,
    );
    _scaleController.value = 1.0;
  }

  @override
  void dispose() {
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  void _onTapDown(_) => _scaleController.reverse();
  void _onTapUp(_) => _scaleController.forward();

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTap: widget.onTap,
          child: BottomSheetOptionContainerWidget(
            child: BottomSheetImageAndTitleWidget(
              image: widget.image,
              text: widget.text,
            ),
          ),
        ),
      ),
    );
  }
}
