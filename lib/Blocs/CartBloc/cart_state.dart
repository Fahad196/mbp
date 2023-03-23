import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/cart_model.dart';

abstract class CartState extends Equatable{
  @override
  List<Object?> get props => [];

}

class CartLoadingState extends CartState {}

class AddToCartState extends CartState{
  List<CartModel> products;
  AddToCartState({required this.products});
  @override
  List<Object?> get props => [products];
}

class QuantityIncreasedState extends CartState {
  final int quantity;
   QuantityIncreasedState({
    required this.quantity,
  });
 
  @override
  List<Object?> get props => [quantity];
}

 class QuantityDecreasedState extends CartState{
  final int quantity;
  QuantityDecreasedState({required this.quantity});
  @override
  List<Object?> get props => [quantity];
 }

class CartErrorState extends CartState{
  final String message;
  CartErrorState(this.message);
}