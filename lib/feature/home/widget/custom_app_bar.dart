
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
  });
  final String text;
  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,

      elevation: 0,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 106, 91, 218),
            child: IconButton(
              onPressed: onPressed,
              icon: Icon(icon, color: Colors.white),
            ),
          ),
          Spacer(),
          Text(
            text,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
