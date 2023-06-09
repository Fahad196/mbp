import 'package:equatable/equatable.dart';

class DeleteCartEvent extends Equatable{
  @override
  List<Object?> get props => [];

}

class DeleteCartLoadingEvent extends DeleteCartEvent{

}
class DeleteItemCartEvent extends DeleteCartEvent{
 final int cartId;
 final int resturantId;
 final String portion;
 final String token;
DeleteItemCartEvent(this.cartId,this.resturantId,this.portion,this.token);
@override
  List<Object?> get props => [cartId,resturantId,portion,token];
}

class RefEvent extends DeleteCartEvent{
  @override
  List<Object?> get props => [];
}