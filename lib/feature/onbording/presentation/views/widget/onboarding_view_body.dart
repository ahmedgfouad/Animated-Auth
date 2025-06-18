import 'package:animated_auth/core/utils/app_router.dart';
import 'package:animated_auth/feature/onbording/presentation/manager/onbording_cubit/onbording_cubit.dart';
import 'package:animated_auth/feature/onbording/presentation/views/widget/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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

    _floatingAnimation =
        Tween<Offset>(
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
              child: PageView.builder(
                controller: _pageController,
                itemCount: 3,
                onPageChanged: (index) {
                  context.read<OnboardingCubit>().changePage(index);
                },
                itemBuilder: (_, index) {
                  return AnimatedBuilder(
                    animation: _pageController,
                    builder: (context, child) {
                      double value = 1.0;
                      if (_pageController.position.haveDimensions) {
                        value = (_pageController.page! - index).abs();
                        value = (1 - value.clamp(0.0, 1.0));
                      }
                      return Transform.scale(
                        scale: value,
                        child: AnimatedOpacity(
                          opacity: value,
                          duration: const Duration(milliseconds: 500),
                          child: SlideTransition(
                            position: _floatingAnimation,
                            child: OnboardingPage(index: index),
                          ),
                        ),
                      );
                    },
                  );
                },
                physics: const BouncingScrollPhysics(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  width: currentIndex == index ? 12 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? Colors.deepPurple
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),
            currentIndex == 2
                ? FadeTransition(
                    opacity: _fadeAnimation,
                    child: ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push(AppRouter.kLogInView);
                      },
                      child: const Text("ابدأ الآن"),
                    ),
                  )
                : IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
            const SizedBox(height: 40),
          ],
        );
      },
    );
  }
}
