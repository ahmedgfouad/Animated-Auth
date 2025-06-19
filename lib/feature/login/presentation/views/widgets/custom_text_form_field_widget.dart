
import 'package:animated_auth/core/utils/colors.dart';
import 'package:animated_auth/feature/login/presentation/manager/password_cubit/password_cubit.dart';
import 'package:animated_auth/feature/login/presentation/views/widgets/password_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.widget,
    required FocusNode focusNode,
  }) : _focusNode = focusNode;

  final PasswordFieldWidget widget;
  final FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityCubit, bool>(
      builder: (context, isHidden) {
        return TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          obscureText: isHidden,
          decoration: InputDecoration(
            hintText: widget.hintText,
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
              return 'Please enter your ${widget.hintText}';
            }
            return null;
          },
        );
      },
    );
  }
}
