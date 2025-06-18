import 'package:animated_auth/feature/home/views/home_view.dart';
import 'package:animated_auth/feature/login/presentation/views/login_view.dart';
import 'package:animated_auth/feature/onbording/onboarding_view.dart';
import 'package:animated_auth/feature/splash/presentation/views/splash_viwe.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static String kSplashView = '/splashView';
  static String kOnboardingView = '/onboardingView';
  static String kLogInView = '/logInView';
  static String kHomeView = '/homeView';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashViwe()),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(path: kLogInView, builder: (context, state) => LoginView()),
      GoRoute(path: kHomeView, builder: (context, state) => HomeView()),
    ],
  );
}
