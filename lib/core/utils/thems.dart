import 'package:animated_auth/core/utils/colors.dart';
import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 237, 239, 240),
  appBarTheme: AppBarTheme(backgroundColor: Colors.white),
  brightness: Brightness.light,
  useMaterial3: true,
  extensions: const [
    AppColors(
      move: Color(0xff667EEA),
      orange: Color(0xffFF9800),
      white: Color(0xffFFFFFF),
      offWhite: Color.fromARGB(255, 237, 239, 240),
      grey: Color(0xff666666),
      green: Color(0xff3AA14C),
    ),
  ],
);

final darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
  useMaterial3: true,
  extensions: const [
    AppColors(
      move: Color(0xff667EEA),
      orange: Color(0xffFF9800),
      white: Color(0xff2a2a2a),
      offWhite: Colors.black,
      grey: Color(0xff666666),
      green: Color(0xff3AA14C),
    ),
  ],
);
