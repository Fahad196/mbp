import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/delete_cart_model.dart';

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