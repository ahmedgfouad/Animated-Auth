
import 'package:animated_auth/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomHomeCardWidget extends StatelessWidget {
  const CustomHomeCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 5,

      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: context.appColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: const Color.fromARGB(255, 136, 215, 139),
                child: Image.asset(image, height: 20),
              ),
              Spacer(),
              Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: context.appColors.grey,
                ),
              ),
            ],
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
