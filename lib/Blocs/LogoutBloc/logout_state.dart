 import 'package:equatable/equatable.dart';


 class LogoutState extends Equatable{
  @override
  List<Object?> get props => [];
}

class LogoutLoadingState extends LogoutState{

}
class LogedoutState extends LogoutState{
//  final String
}

class LogoutErrorState extends LogoutState{
  final String message;
  LogoutErrorState(this.message);
 
}

class NotLoggedOutState extends LogoutState{
  @override
  List<Object?> get props => [];
} 
