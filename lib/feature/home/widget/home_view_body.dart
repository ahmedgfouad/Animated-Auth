// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_auth/core/utils/images.dart';
import 'package:animated_auth/feature/home/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({super.key});

  final List<Map<String, dynamic>> dashboardData = [
    {'title': 'Orders', 'subtitle': '1,234', 'image': AppImages.orderImg},
    {'title': 'Sales', 'subtitle': '1,234', 'image': AppImages.saleImg},
    {'title': 'Messages', 'subtitle': '1,234', 'image': AppImages.messageImg},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(
              text: 'Profile',
              onPressed: () {},
              icon: Icons.dark_mode,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => CustomHomeCardWidget(
                  title: dashboardData[index]['title'],
                  subtitle: dashboardData[index]['subtitle'],
                  image: dashboardData[index]['image'],
                ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: MediaQuery.of(context).size.height / 5,
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
                  color: const Color.fromARGB(255, 97, 100, 103),
                ),
              ),
            ],
          ),
          // const SizedBox(height: 18),
          Text(
            subtitle,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
