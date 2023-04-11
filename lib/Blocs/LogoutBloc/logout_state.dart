 import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

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