import 'package:animated_auth/feature/onbording/presentation/views/widget/onboarding_dots_indicator_widget.dart';
import 'package:animated_auth/feature/onbording/presentation/views/widget/onboarding_navigation_button_widget.dart';
import 'package:animated_auth/feature/onbording/presentation/views/widget/onboarding_page_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/onbording_cubit/onbording_cubit.dart'; 

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  late final AnimationController _fadeController;
  late final AnimationController _floatingController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _floatingAnimation;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _floatingAnimation = Tween<Offset>(
      begin: const Offset(0, -0.02),
      end: const Offset(0, 0.02),
    ).animate(
      CurvedAnimation(parent: _floatingController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _fadeController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, currentIndex) {
        if (currentIndex == 2) {
          _fadeController.forward();
        } else {
          _fadeController.reset();
        } 
        return Column(
          children: [
            Expanded(
              child: OnboardingPageViewWidget(
                pageController: _pageController,
                floatingAnimation: _floatingAnimation,
              ),
            ),
            OnboardingDotsIndicatorWidget(currentIndex: currentIndex),
            const SizedBox(height: 20),
            OnboardingNavigationButtonWidget(
              currentIndex: currentIndex,
              fadeAnimation: _fadeAnimation,
              pageController: _pageController,
            ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}




