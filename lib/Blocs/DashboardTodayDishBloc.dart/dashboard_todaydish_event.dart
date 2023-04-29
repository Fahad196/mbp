import 'package:equatable/equatable.dart';

class DashboardTodayDishEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardTodayDishLoadingEvent extends DashboardTodayDishEvent {}

class DashboardTodayDishLoadedEvent extends DashboardTodayDishEvent {
  final int resId;
 final String token;
 DashboardTodayDishLoadedEvent(this.resId,this.token);
}