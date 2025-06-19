import 'package:animated_auth/core/utils/app_router.dart';
import 'package:animated_auth/core/utils/colors.dart';
import 'package:animated_auth/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingNavigationButtonWidget extends StatelessWidget {
  const OnboardingNavigationButtonWidget({
    super.key,
    required this.currentIndex,
    required this.fadeAnimation,
    required this.pageController,
  });

  final int currentIndex;
  final Animation<double> fadeAnimation;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return currentIndex == 2
        ? FadeTransition(
            opacity: fadeAnimation,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: CustomButton(
                text: 'Get Started',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kLogInView);
                },
                loadingText: 'waiting...',
              ),
            ),
          )
        : IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            color: context.appColors.move,
            onPressed: () {
              pageController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            },
          );
  }
}
