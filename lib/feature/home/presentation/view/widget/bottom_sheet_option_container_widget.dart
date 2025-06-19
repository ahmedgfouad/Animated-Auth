import 'package:animated_auth/core/utils/colors.dart';
import 'package:flutter/material.dart';

class BottomSheetOptionContainerWidget extends StatelessWidget {
  const BottomSheetOptionContainerWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: MediaQuery.of(context).size.height / 8,
      decoration: BoxDecoration(
        color: context.appColors.offWhite,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: context.appColors.move,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
