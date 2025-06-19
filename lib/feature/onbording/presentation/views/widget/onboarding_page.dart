import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final IconData icon;
  const OnboardingPage({
    super.key,
    required this.index,
    required this.title,
    required this.description,
    required this.icon,
  });

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
            child:  Center(
              child: Icon(icon, color: Colors.white, size: 80),
            ),
          ),
          const SizedBox(height: 40),
          Text(
           title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
           Text(
           description,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
