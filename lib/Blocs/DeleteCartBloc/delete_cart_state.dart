import 'package:equatable/equatable.dart';

class DeleteCartState extends Equatable{
  @override
  List<Object?> get props => [];

}
class DeleteCartLoadingState extends DeleteCartState{}
class DeleteItemCartState extends DeleteCartState{
  
}
class RefState extends DeleteCartState{
  @override
  List<Object?> get props => [];
}
class DeleteCartErrorState extends DeleteCartState{
  final String message;
  DeleteCartErrorState(this.message);
}