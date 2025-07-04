import 'package:animated_auth/feature/home/data/models/dashpord_data_model.dart';
import 'package:animated_auth/feature/home/presentation/manager/home_cubit/home_cubit%20.dart';
import 'package:animated_auth/feature/home/presentation/view/widget/custom_home_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfHomeCartForMobileWidget extends StatelessWidget {
  const ListOfHomeCartForMobileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, List<DashboardItemModel>>(
      builder: (context, dashboardData) {
        return ListView.separated(
          itemCount: dashboardData.length,
          itemBuilder: (context, index) {
            final item = dashboardData[index];
            return CustomHomeCardWidget(
              title: item.title,
              subtitle: item.subtitle,
              image: item.image,
            );
          },
          separatorBuilder: (_, __) =>
              const SizedBox(height: 20),
        );
      },
    );
  }
}
