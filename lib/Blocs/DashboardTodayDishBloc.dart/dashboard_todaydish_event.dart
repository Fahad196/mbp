import 'package:equatable/equatable.dart';

class DashboardTodayDishEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardTodayDishLoadingEvent extends DashboardTodayDishEvent {}

class DashboardTodayDishLoadedEvent extends DashboardTodayDishEvent {
  final int id;
 DashboardTodayDishLoadedEvent(this.id);
}