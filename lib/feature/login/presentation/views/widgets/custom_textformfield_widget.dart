import 'package:animated_auth/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.keyboardType,
  });

  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget>
    with SingleTickerProviderStateMixin {
  late FocusNode _focusNode;
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);

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
      if (_isFocused) {
        _scaleController.forward();
      } else {
        _scaleController.reverse();
      }
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
  return LayoutBuilder(
    builder: (context, constraints) {
      bool isWide = constraints.maxWidth > 600; 
      double fieldWidth = isWide ? constraints.maxWidth * 0.5 : constraints.maxWidth;

      return Center( 
        child: SizedBox(
          width: fieldWidth,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: context.appColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isFocused
                      ? context.appColors.grey
                      : Colors.grey.shade300,
                  width: 1.5,
                ),
                boxShadow: _isFocused
                    ? [
                        BoxShadow(
                          color: context.appColors.move.withAlpha(100),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : [],
              ),
              child: TextFormField(
                focusNode: _focusNode,
                controller: widget.controller,
                keyboardType: widget.keyboardType,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: context.appColors.grey),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال ${widget.hintText}';
                  }
                  return null;
                },
              ),
            ),
          ),
        ),
      );
    },
  );
}


}
