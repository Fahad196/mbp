import 'package:equatable/equatable.dart';

class DeleteCartState extends Equatable{
  @override
  List<Object?> get props => [];

}
class DeleteCartLoadingState extends DeleteCartState{}
class DeleteItemCartState extends DeleteCartState{}
class DeleteCartErrorState extends DeleteCartState{
  String message;
  DeleteCartErrorState(this.message);
}