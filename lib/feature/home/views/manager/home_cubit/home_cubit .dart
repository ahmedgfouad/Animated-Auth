import 'package:animated_auth/feature/home/data/models/dashpord_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<DashboardItemModel>> {
  HomeCubit() : super([]);

  void loadDashboardData() {
    emit([
      DashboardItemModel(
        title: 'Orders',
        subtitle: '1,234',
        image: 'assets/orders.jpg',
      ),
      DashboardItemModel(
        title: 'Sales',
        subtitle: '\$ 15,234',
        image: 'assets/sale.webp',
      ),
      DashboardItemModel(
        title: 'Messages',
        subtitle: '98',
        image: 'assets/message.webp',
      ),
    ]);
  }
}
