import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_auth/core/theme/colors.dart';
import 'package:animated_auth/feature/login/presentation/manager/password_cubit/password_cubit.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.focusNode,
  });

  final String hintText;
  final TextEditingController? controller;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, bool>(
      builder: (context, isHidden) {
        return TextFormField(
          controller: controller,
          focusNode: focusNode,
          obscureText: isHidden,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: context.appColors.grey),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(
                isHidden ? Icons.visibility_off : Icons.visibility,
                color: context.appColors.grey,
              ),
              onPressed: () =>
                  context.read<PasswordVisibilityCubit>().toggleVisibility(),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your $hintText';
            }
            return null;
          },
        );
      },
    );
  }
}
