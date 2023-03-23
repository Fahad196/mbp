import 'package:equatable/equatable.dart';

 abstract class DashboardMenuEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class DashboardMenuLoadingEvent extends DashboardMenuEvent{}
class DashboardMenuLoadedEvent extends DashboardMenuEvent{
 final int id;
 DashboardMenuLoadedEvent(this.id);
}