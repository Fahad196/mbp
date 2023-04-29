import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/cart_model.dart';

abstract class CartState extends Equatable{
  @override
  List<Object?> get props => [];

}

class CartLoadingState extends CartState {}

class AddToCartState extends CartState{
 final List<CartModel> products;
  AddToCartState({required this.products});
  @override
  List<Object?> get props => [products];
}


class CartErrorState extends CartState{
  final String message;
  CartErrorState(this.message);
}