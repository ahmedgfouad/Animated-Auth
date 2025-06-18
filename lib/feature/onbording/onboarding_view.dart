import 'package:animated_auth/feature/onbording/presentation/manager/onbording_cubit/onbording_cubit.dart';
import 'package:animated_auth/feature/onbording/presentation/views/widget/onboarding_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
      create: (_) => OnboardingCubit(),
      child: const OnboardingViewBody(),
    ),
    );
  }
}
