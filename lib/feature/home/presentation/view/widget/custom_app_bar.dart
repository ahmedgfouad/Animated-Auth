import 'package:animated_auth/feature/home/presentation/manager/theam_cubit/theam_cubit%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animated_auth/core/utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Row(
        children: [
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final isDark = themeMode == ThemeMode.dark;
              return CircleAvatar(
                backgroundColor: context.appColors.move,
                child: IconButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  icon: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    color: context.appColors.white,
                  ),
                ),
              );
            },
          ),
          const Spacer(),
          const Text(
            "Dashboard",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
