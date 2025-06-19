import 'package:animated_auth/core/utils/images.dart';
import 'package:animated_auth/feature/home/widget/bottom_sheet_option_widget.dart';
import 'package:flutter/material.dart';

class BottomSheetContentWidget extends StatelessWidget {
  const BottomSheetContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Quick procedures",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomSheetOptionWidget(
              text: "settings",
              image: AppImages.settingImg,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            BottomSheetOptionWidget(
              text: "New Order",
              image: AppImages.orderImg,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomSheetOptionWidget(
              text: "Report",
              image: AppImages.reportImg,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            BottomSheetOptionWidget(
              text: "Profile",
              image: AppImages.profileImg,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
