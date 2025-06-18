import 'package:animated_auth/core/utils/app_router.dart';
import 'package:animated_auth/core/utils/images.dart';
import 'package:animated_auth/core/widgets/custom_button.dart';
import 'package:animated_auth/feature/login/presentation/views/widgets/custom_textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.01),
      end: const Offset(0, 0.01),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SlideTransition(
              position: _slideAnimation,
              child: Image.asset(
                AppImages.splashImg,
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            CustomTextFormFieldWidget(hintText: 'البريد الإلكتروني'),
            const SizedBox(height: 30),
            CustomTextFormFieldWidget(hintText: 'كلمة المرور'),
            const SizedBox(height: 30),
            CustomButton(text: 'text', onPressed: () {
              GoRouter.of(context).push(AppRouter.kHomeView);
            }),
          ],
        ),
      ),
    );
  }
}
