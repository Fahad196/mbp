 import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable{
  @override
  List<Object?> get props => [];
}

class LogoutLoadingState extends LogoutState{

}
class LogedoutState extends LogoutState{
// final String token;
// LogedoutState(this.token);
}

class LogoutErrorState extends LogoutState{
  final String message;
  LogoutErrorState(this.message);
}