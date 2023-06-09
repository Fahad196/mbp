import 'package:equatable/equatable.dart';

class DashboardHotSellingEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardHotSellingLoadingEvent extends DashboardHotSellingEvent {}

class DashboardHotSellingLoadedEvent extends DashboardHotSellingEvent {
  final int id;
  final String token;
  DashboardHotSellingLoadedEvent(this.id,this.token);
}
