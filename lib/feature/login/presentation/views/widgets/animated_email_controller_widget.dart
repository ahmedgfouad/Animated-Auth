
import 'package:animated_auth/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AnimatedEmailContainerWidget extends StatelessWidget {
  const AnimatedEmailContainerWidget({
    super.key,
    required this.child,
    required this.scaleAnimation,
    required this.isFocused,
  });

  final Widget child;
  final Animation<double> scaleAnimation;
  final bool isFocused;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isWide = constraints.maxWidth > 600;
        double fieldWidth = isWide
            ? constraints.maxWidth * 0.5
            : constraints.maxWidth;

        return Center(
          child: SizedBox(
            width: fieldWidth,
            child: ScaleTransition(
              scale: scaleAnimation,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: context.appColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isFocused
                        ? context.appColors.grey
                        : context.appColors.grey.withAlpha(100),
                    width: 1.5,
                  ),
                  boxShadow: isFocused
                      ? [
                          BoxShadow(
                            color: context.appColors.move.withAlpha(100),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : [],
                ),
                child: child,
              ),
            ),
          ),
        );
      },
    );
  }
}
