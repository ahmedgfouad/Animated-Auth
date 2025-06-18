import 'package:animated_auth/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.backgroundColor,
    this.textColor,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);

    _colorAnimation = ColorTween(
      begin: const Color.fromARGB(255, 195, 92, 205),
      end: const Color.fromARGB(255, 83, 127, 208),
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void handleTap() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      isLoading = false;
    });

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 600;

        double buttonWidth = isWide
            ? constraints.maxWidth * 0.5
            : constraints.maxWidth;

        return Center(
          child: SizedBox(
            height: widget.height ?? 55,
            width: widget.width ?? buttonWidth,
            child: ElevatedButton(
              onPressed: isLoading ? null : handleTap,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    widget.backgroundColor ?? context.appColors.move,
                foregroundColor: widget.textColor ?? Colors.white,
                elevation: 6,
                shadowColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: isLoading
                  ? AnimatedBuilder(
                      animation: _colorAnimation,
                      builder: (_, __) => Text(
                        'جاري تسجيل الدخول...',
                        style: TextStyle(
                          color: _colorAnimation.value,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 18,
                        color: widget.textColor ?? Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
