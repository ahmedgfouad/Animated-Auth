import 'package:animated_auth/core/router/app_router.dart';
import 'package:animated_auth/core/theme/thems.dart';
import 'package:animated_auth/feature/home/presentation/manager/theam_cubit/theam_cubit%20.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(create: (context) => ThemeCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>( 
      builder: (context, themeMode) {
        return MaterialApp.router(
        debugShowCheckedModeBanner: false, 
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        title: 'Flutter Demo',
        routerConfig: AppRouter.router,
      );
      }
    );
  }
}
