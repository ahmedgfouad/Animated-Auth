import 'package:animated_auth/feature/login/presentation/views/widgets/animated_email_controller_widget.dart';
import 'package:flutter/material.dart';
import 'package:animated_auth/feature/login/presentation/views/widgets/custom_text_field_widget.dart';

class EmailFieldWidget extends StatefulWidget {
  const EmailFieldWidget({super.key, required this.hintText, this.controller});

  final String hintText;
  final TextEditingController? controller;

  @override
  State<EmailFieldWidget> createState() => _EmailFieldWidgetState();
}

class _EmailFieldWidgetState extends State<EmailFieldWidget>
    with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener(_handleFocusChange);

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );
  }

  void _handleFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
      _isFocused ? _scaleController.forward() : _scaleController.reverse();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedEmailContainerWidget(
      scaleAnimation: _scaleAnimation,
      isFocused: _isFocused,
      child: CustomTextFieldWidget(
        hintText: widget.hintText,
        controller: widget.controller,
        focusNode: _focusNode,
      ),
    );
  }
}
