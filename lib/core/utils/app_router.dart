import 'package:animated_auth/feature/home/presentation/view/home_view.dart';
import 'package:animated_auth/feature/login/presentation/manager/password_cubit/password_cubit.dart';
import 'package:animated_auth/feature/login/presentation/views/login_view.dart';
import 'package:animated_auth/feature/onbording/onboarding_view.dart';
import 'package:animated_auth/feature/splash/presentation/views/splash_viwe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kSplashView = '/splashView';
  static String kOnboardingView = '/onboardingView';
  static String kLogInView = '/logInView';
  static String kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) =>
            _buildFadeScaleTransitionPage(state, const SplashViwe()),
      ),
      GoRoute(
        path: kOnboardingView,
        pageBuilder: (context, state) =>
            _buildFadeScaleTransitionPage(state, OnboardingView()),
      ),
      GoRoute(
        path: kLogInView,
        pageBuilder: (context, state) => _buildFadeScaleTransitionPage(
          state,
          BlocProvider(
            create: (context) => PasswordVisibilityCubit(),
            child: LoginView(),
          ),
        ),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) =>
            _buildFadeScaleTransitionPage(state, HomeView()),
      ),
    ],
  );

  static CustomTransitionPage _buildFadeScaleTransitionPage(
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
