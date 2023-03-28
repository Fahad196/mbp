import 'package:equatable/equatable.dart';

class UpdateQuantityCartEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class UpdateQuantityCartLoadingEvent extends UpdateQuantityCartEvent{

}
class UpdateItemQuantityCartEvent extends UpdateQuantityCartEvent{
  int itemId;
  int itemPrice;
  int itemQuantity;
  int resturantId;
  String portion;
UpdateItemQuantityCartEvent(this.itemId,this.itemPrice,this.itemQuantity,this.resturantId,this.portion);
}
