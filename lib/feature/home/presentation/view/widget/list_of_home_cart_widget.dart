
import 'package:animated_auth/feature/home/presentation/view/widget/list_of_home_cart_for_mobile_widget.dart';
import 'package:animated_auth/feature/home/presentation/view/widget/list_of_home_cart_for_web_widget.dart';
import 'package:flutter/material.dart';

class ListOfHomeCartWidget extends StatelessWidget {
  const ListOfHomeCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 600;
          if (isWide) {
            return ListOfHomeCardForWebViewWidget();
          } else {
            return ListOfHomeCartForMobileWidget();
          }
        },
      ),
    );
  }
}
