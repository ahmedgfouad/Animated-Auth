import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final int index;
  const OnboardingPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF7B4397),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Icon(Icons.rocket_launch, color: Colors.white, size: 80),
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            "مرحباً بك!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            "اكتشف تجربة جديدة مع تطبيقنا المتطور والمليء بالميزات الرائعة",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
