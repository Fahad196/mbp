
import 'package:equatable/equatable.dart';

abstract class LogoutEvent extends Equatable{
  @override
  List<Object?> get props => [];
}

class LogoutLoadingEvent extends LogoutEvent{}

class LogedoutEvent extends LogoutEvent{
  final String token;
  LogedoutEvent(this.token);
  
}

class NotLoggedOutEvent extends LogoutEvent{
  @override
  List<Object?> get props => [];
} 

