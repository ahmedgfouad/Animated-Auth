import 'package:animated_auth/core/utils/app_router.dart';
import 'package:animated_auth/core/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashBodyWidget extends StatefulWidget {
  const SplashBodyWidget({super.key});

  @override
  State<SplashBodyWidget> createState() => _SplashBodyWidgetState();
}

class _SplashBodyWidgetState extends State<SplashBodyWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    initFadeAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: Image.asset(AppImages.loginImg, height: 200, width: 200),
      ),
    );
  }

  void initFadeAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRouter.kOnboardingView);
    });
  }
}
