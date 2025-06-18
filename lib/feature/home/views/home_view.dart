import 'package:animated_auth/feature/home/views/manager/home_cubit/home_cubit%20.dart';
import 'package:animated_auth/feature/home/widget/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: HomeViewBody(),
      ),
    );
  }
}
