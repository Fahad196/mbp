import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  LoginEvent():super();
  @override
  List<Object?> get props => [];
}

class StartEvent extends LoginEvent{}

class LoginButtonPressedEvent extends LoginEvent{
  final String email;
  final String password;
  LoginButtonPressedEvent(this.email,this.password);
}