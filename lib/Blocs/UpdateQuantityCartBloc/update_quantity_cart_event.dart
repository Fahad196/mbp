import 'package:equatable/equatable.dart';

class UpdateQuantityCartEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class InitailQuantityEvent extends UpdateQuantityCartEvent{
}
class UpdateQuantityCartLoadingEvent extends UpdateQuantityCartEvent{

}


class IncreaseItemQuantityCartEvent extends UpdateQuantityCartEvent{
  final int cartId;
  final int itemPrice;
 final int itemQuantity;
 final int resturantId;
 final String portion;
 final String token;
IncreaseItemQuantityCartEvent({required this.cartId,required this.itemPrice,required this.itemQuantity,required this.resturantId,required this.portion,required this.token});
}


class DecreaseItemQuantityCartEvent extends UpdateQuantityCartEvent{
  final int cartId;
  final int itemPrice;
 final int itemQuantity;
 final int resturantId;
 final String portion;
 final String token;
DecreaseItemQuantityCartEvent({required this.cartId,required this.itemPrice,required this.itemQuantity,required this.resturantId,required this.portion,required this.token});
}

class RefreshQuantityEvent extends UpdateQuantityCartEvent{
  @override
  List<Object?> get props => [];
}