import 'package:flutter/material.dart';

extension AppColorHelper on BuildContext {
  AppColors get appColors => Theme.of(this).extension<AppColors>()!;
}

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color move;
  final Color orange;
  final Color white;
  final Color offWhite;
  final Color grey;
  final Color green;

  const AppColors({
    required this.move,
    required this.orange,
    required this.white,
    required this.offWhite,
    required this.grey,
    required this.green,
  });

  @override
  AppColors copyWith({
    Color? browen,
    Color? orange,
    Color? white,
    Color? offWhite,
    Color? grey,
    Color? green,
  }) {
    return AppColors(
      move: browen ?? move,
      orange: orange ?? this.orange,
      white: white ?? this.white,
      offWhite: offWhite ?? this.offWhite,
      grey: grey ?? this.grey,
      green: green ?? this.green,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      move: Color.lerp(move, other.move, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      white: Color.lerp(white, other.white, t)!,
      offWhite: Color.lerp(offWhite, other.offWhite, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      green: Color.lerp(green, other.green, t)!,
    );
  }
}
