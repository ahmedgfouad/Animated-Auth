import 'package:animated_auth/core/utils/colors.dart';
import 'package:animated_auth/feature/home/views/manager/home_cubit/home_cubit%20.dart';
import 'package:animated_auth/feature/home/widget/animagted_bottom_sheet_content.dart';
import 'package:animated_auth/feature/home/widget/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: const HomeViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.appColors.move,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => const AnimatedBottomSheetContent(),
          );
        },
        child: Icon(Icons.add, color: context.appColors.white, size: 30),
      ),
    );
  }
}
