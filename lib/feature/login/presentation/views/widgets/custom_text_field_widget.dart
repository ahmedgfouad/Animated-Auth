import 'package:animated_auth/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required FocusNode focusNode,
    required this.hintText,
    this.controller,
  }) : _focusNode = focusNode;

  final FocusNode _focusNode;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: InputBorder.none,
        hintStyle: TextStyle(color: context.appColors.grey),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ' Please enter your $hintText';
        }
        return null;
      },
    );
  }
}
