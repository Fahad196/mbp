import 'package:equatable/equatable.dart';
import '../../Models/dashboard_menu_model.dart';


class DashboardMenuState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardMenuLoadingState extends DashboardMenuState {}

class DashboardMenuLoadedstate extends DashboardMenuState {
  List<DashboardMenuModel> hotSellingList;
  DashboardMenuLoadedstate(this.hotSellingList);
}

class DashboardMenuErrorState extends DashboardMenuState {
  final String message;
  DashboardMenuErrorState({required this.message});
}
