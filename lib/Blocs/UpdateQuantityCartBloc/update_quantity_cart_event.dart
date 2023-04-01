import 'package:equatable/equatable.dart';

class UpdateQuantityCartEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class UpdateQuantityCartLoadingEvent extends UpdateQuantityCartEvent{

}
class UpdateItemQuantityCartEvent extends UpdateQuantityCartEvent{
  final int cartId;
  final int itemPrice;
 final int itemQuantity;
 final int resturantId;
 final String portion;
 final String token;
UpdateItemQuantityCartEvent({required this.cartId,required this.itemPrice,required this.itemQuantity,required this.resturantId,required this.portion,required this.token});
}
