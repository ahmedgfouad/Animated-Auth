import 'package:flutter/material.dart';

class BottomSheetImageAndTitleWidget extends StatelessWidget {
  const BottomSheetImageAndTitleWidget({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, width: 24),
        const SizedBox(height: 5),
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}