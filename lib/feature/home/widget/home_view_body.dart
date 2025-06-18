import 'package:animated_auth/core/utils/colors.dart';
import 'package:animated_auth/feature/home/data/models/dashpord_data_model.dart';
import 'package:animated_auth/feature/home/views/manager/home_cubit/home_cubit%20.dart';
import 'package:animated_auth/feature/home/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  initState() {
    context.read<HomeCubit>().loadDashboardData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<HomeCubit, List<DashboardItemModel>>(
                builder: (context, dashboardData) {
                  return ListView.separated(
                    itemCount: dashboardData.length,
                    itemBuilder: (context, index) {
                      final item = dashboardData[index];
                      return CustomHomeCardWidget(
                        title: item.title,
                        subtitle: item.subtitle,
                        image: item.image,
                      );
                    },
                    separatorBuilder: (_, __) => const SizedBox(height: 20),
                  );
                },
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
        color: context.appColors.white,
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
                  color: context.appColors.grey,
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
