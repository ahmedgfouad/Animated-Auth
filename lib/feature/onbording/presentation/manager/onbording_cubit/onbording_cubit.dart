import 'package:animated_auth/feature/onbording/data/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void changePage(int index) => emit(index);

  final List<OnboardingPageModel> pages = const [
    OnboardingPageModel(
      title: "Welcome!",
      description: "Discover a new experience with our advanced and feature-rich app.",
      icon: Icons.rocket_launch,
    ),
    OnboardingPageModel(
      title: "Easy to Use",
      description: "A smooth and simple interface designed for all users.",
      icon: Icons.touch_app,
    ),
    OnboardingPageModel(
      title: "Your Privacy Matters",
      description: "We protect your data with the highest level of security.",
      icon: Icons.lock,
    ),
  ];
}
