import 'package:animated_auth/core/utils/app_router.dart';
import 'package:animated_auth/core/widgets/custom_button.dart';
import 'package:animated_auth/feature/login/presentation/manager/password_cubit/password_cubit.dart';
import 'package:animated_auth/feature/login/presentation/views/widgets/animated_login_image_widget.dart';
import 'package:animated_auth/feature/login/presentation/views/widgets/email_filed_widget.dart';
import 'package:animated_auth/feature/login/presentation/views/widgets/password_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController passwordController = TextEditingController();
  GlobalKey formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AnimatedLoginImageWidget(),
              const SizedBox(height: 30),
              EmailFieldWidget(hintText: 'Email'),
              const SizedBox(height: 30),

              BlocProvider(
                create: (_) => PasswordVisibilityCubit(),
                child: PasswordFieldWidget(
                  hintText: 'Password',
                  controller: passwordController,
                ),
              ),

              const SizedBox(height: 30),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
