import 'package:animated_auth/feature/home/data/models/dashpord_data_model.dart';
import 'package:animated_auth/feature/home/presentation/manager/home_cubit/home_cubit%20.dart';
import 'package:animated_auth/feature/home/presentation/view/widget/custom_home_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfHomeCardForWebViewWidget extends StatelessWidget {
  const ListOfHomeCardForWebViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, List<DashboardItemModel>>(
      builder: (context, dashboardData) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;

            // نحدد عدد الأعمدة
            final crossAxisCount = screenWidth > 1000 ? 3 : 2;

            // نحدد عرض كل عنصر
            final itemWidth =
                (screenWidth - 50 * (crossAxisCount - 1)) / crossAxisCount;

            // نحدد ارتفاع ثابت أو نسبي
            final itemHeight = 130;

            // ثم نحسب النسبة
            final aspectRatio = itemWidth / itemHeight;

            return GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 50,
                crossAxisSpacing: 50,
                childAspectRatio: aspectRatio,
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
      },
    );
  }
}
