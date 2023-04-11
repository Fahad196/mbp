import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitailState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  LoginSuccess({required this.token});
  @override
  List<Object?> get props => [token];
}
class PasswordOrUsernameState extends LoginState{
  
}
class LoginErrorState extends LoginState {
  final String message;
  LoginErrorState(this.message);
}
