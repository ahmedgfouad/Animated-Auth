import 'package:animated_auth/feature/home/presentation/manager/home_cubit/home_cubit%20.dart';
import 'package:animated_auth/feature/home/presentation/view/widget/custom_app_bar.dart';
import 'package:animated_auth/feature/home/presentation/view/widget/list_of_home_cart_widget.dart';
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
            ListOfHomeCartWidget(),
          ],
        ),
      ),
    );
  }
}
