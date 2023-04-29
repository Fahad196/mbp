import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/cart_view_model.dart';

abstract class CartViewState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartViewLoadingState extends CartViewState {}

class CartViewLoadedState extends CartViewState {
  final List<CartViewModel> listOfCartItems;
  CartViewLoadedState(this.listOfCartItems);
  @override
  List<Object?> get props => [listOfCartItems];
}

class CartViewErrorState extends CartViewState {
  final String message;
  CartViewErrorState(this.message);
}

// class InitialQuantityState extends CartViewState{
// }

// class UpdateQuantityCartLoadingState extends CartViewState{}

// class IncreaseItemQuantityCartState extends CartViewState{
//  final  UpdateQuantityCartModel quantityCartModel;
//   IncreaseItemQuantityCartState({required this.quantityCartModel});
//   @override
//   List<Object?> get props => [quantityCartModel];
// }

// class DecreaseItemQuantityCartState extends CartViewState{
//  final  UpdateQuantityCartModel quantityCartModel;
//   DecreaseItemQuantityCartState({required this.quantityCartModel});
//   @override
//   List<Object?> get props => [quantityCartModel];
// }

// class UpdateQuantityCartErrorState extends CartViewState{
//   final String message;
//   UpdateQuantityCartErrorState(this.message);
// }

class RefreshCartViewState extends CartViewState {
  @override
  List<Object?> get props => [];
}
