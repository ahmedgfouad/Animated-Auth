

import 'package:animated_auth/feature/home/data/models/dashpord_data_model.dart';
import 'package:animated_auth/feature/home/views/manager/home_cubit/home_cubit%20.dart';
import 'package:animated_auth/feature/home/widget/custom_home_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder;

class ListOfHomeCardForWebViewWidget extends StatelessWidget {
  const ListOfHomeCardForWebViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, List<DashboardItemModel>>(
      builder: (context, dashboardData) {
        return GridView.builder(
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                childAspectRatio: 5,
              ),
          itemCount: dashboardData.length,
          itemBuilder: (context, index) {
            final item = dashboardData[index]; 
            return CustomHomeCardWidget(
              title: item.title,
              subtitle: item.subtitle,
              image: item.image,
            );
          },
        );
      },
    );
  }
}
