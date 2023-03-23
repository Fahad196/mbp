import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/cart_model.dart';
import 'package:mybigplate/Models/cart_view_model.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartLoadingEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int itemId;
  final int itemPrice;
  final int itemQuantity;
  final int categoryId;
  final int resturantId;
  AddToCartEvent(this.itemId, this.itemPrice, this.itemQuantity,
      this.categoryId, this.resturantId);
}

class IncreaseProductQuantityEvent extends CartEvent {
  final CartModel product;
  IncreaseProductQuantityEvent({
    required this.product,
  });
  @override
  List<Object?> get props => [product.itemQuantity];
}

class DecreaseProductQuantityEvent extends CartEvent {
  final CartModel product;
  DecreaseProductQuantityEvent({
    required this.product,
  });
  @override
  List<Object?> get props => [product.itemQuantity];
}
