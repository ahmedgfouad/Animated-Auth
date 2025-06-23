import 'package:animated_auth/core/theme/colors.dart';
import 'package:animated_auth/feature/splash/presentation/views/widgets/splash_body_widget.dart';
import 'package:flutter/material.dart';

class SplashViwe extends StatelessWidget {
  const SplashViwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.white,
      body: SplashBodyWidget(),
    );
  }
}
