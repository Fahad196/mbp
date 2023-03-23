import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/dashboard_hotselling_model.dart';

class DashboardHotSellingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardHotSellingLoadingState extends DashboardHotSellingState {}

class DashboardHotSellingLoadedstate extends DashboardHotSellingState {
  List<DashboardHotSellingModel> hotSellingList;
  DashboardHotSellingLoadedstate(this.hotSellingList);
}

class DashboardHotSellingErrorState extends DashboardHotSellingState {
  final String message;
  DashboardHotSellingErrorState({required this.message});
}
