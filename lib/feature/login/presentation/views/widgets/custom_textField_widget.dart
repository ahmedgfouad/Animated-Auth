import 'package:animated_auth/core/utils/colors.dart';
import 'package:animated_auth/feature/login/presentation/views/widgets/email_filed_widget.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required FocusNode focusNode,
    required this.widget,
  }) : _focusNode = focusNode;

  final FocusNode _focusNode;
  final EmailFieldWidget widget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: InputBorder.none,
        hintStyle: TextStyle(color: context.appColors.grey),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return ' Please enter your ${widget.hintText}';
        }
        return null;
      },
    );
  }
}
