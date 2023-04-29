import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  const LoginEvent():super();
  @override
  List<Object?> get props => [];
}

class StartEvent extends LoginEvent{}

class LoginButtonPressedEvent extends LoginEvent{
  final String email;
  final String password;
  const LoginButtonPressedEvent(this.email,this.password);
  @override
  List<Object?> get props => [email,password];
}

class IsLoggedIn extends LoginEvent{
  
}