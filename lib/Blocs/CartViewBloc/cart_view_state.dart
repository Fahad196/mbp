import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/cart_view_model.dart';

abstract class CartViewState extends Equatable{
  @override
  List<Object?> get props => [];

}

class CartViewLoadingState extends CartViewState {}
class CartViewLoadedState extends CartViewState{
  List<CartViewModel> listOfCartItems;
  CartViewLoadedState(this.listOfCartItems);
}
class CartViewErrorState extends CartViewState{
  final String message;
  CartViewErrorState(this.message);
}