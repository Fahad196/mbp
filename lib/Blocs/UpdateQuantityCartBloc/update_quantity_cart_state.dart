import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/update_quantity_cart_model.dart';

class UpdateQuantityCartState extends Equatable{
  @override
  List<Object?> get props => [];

}
class UpdateQuantityCartLoadingState extends UpdateQuantityCartState{}
class UpdateItemQuantityCartState extends UpdateQuantityCartState{
  List<UpdateQuantityCartModel> quantityList;
  UpdateItemQuantityCartState(this.quantityList);
}
class UpdateQuantityCartErrorState extends UpdateQuantityCartState{
  String message;
  UpdateQuantityCartErrorState(this.message);
}