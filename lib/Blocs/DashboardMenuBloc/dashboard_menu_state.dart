import 'package:equatable/equatable.dart';
import '../../Models/dashboard_menu_model.dart';


class DashboardMenuState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardMenuLoadingState extends DashboardMenuState {}

class DashboardMenuLoadedstate extends DashboardMenuState {
 final List<DashboardMenuModel> menu;
  DashboardMenuLoadedstate(this.menu);
  @override
  List<Object?> get props => [menu];
}

class DashboardMenuErrorState extends DashboardMenuState {
  final String message;
  DashboardMenuErrorState({required this.message});
}
