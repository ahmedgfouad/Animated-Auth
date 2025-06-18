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
    return ScaleTransition(
      scale: _scaleAnimation,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _isFocused
                ? const Color.fromARGB(255, 122, 160, 222)
                : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: _isFocused
              ? [
                  BoxShadow(
                    color: const Color.fromARGB(255, 137, 174, 238),
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
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'يرجى إدخال ${widget.hintText}';
            }
            return null;
          },
        ),
      ),
    );
  }
}
