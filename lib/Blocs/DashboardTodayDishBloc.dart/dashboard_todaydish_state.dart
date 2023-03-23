import 'package:equatable/equatable.dart';
import '../../Models/dashboard_todaydish_model.dart';

class DashboardTodayDishState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardTodayDishLoadingState extends DashboardTodayDishState {}

class DashboardTodayDishLoadedstate extends DashboardTodayDishState {
  List<DashboardTodayDishModel> hotSellingList;
  DashboardTodayDishLoadedstate(this.hotSellingList);
}

class DashboardTodayDishErrorState extends DashboardTodayDishState {
  final String message;
  DashboardTodayDishErrorState({required this.message});
}