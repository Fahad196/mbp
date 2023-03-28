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
  final String type;
  final String Portion;
  AddToCartEvent(this.itemId, this.itemPrice, this.itemQuantity,
      this.categoryId, this.resturantId, this.type, this.Portion);
}

class IncreaseProductQuantityEvent extends CartEvent {
  final CartModel product;
  final int? totalAmount;
  IncreaseProductQuantityEvent({
    required this.product,
     this.totalAmount
  });
  @override
  List<Object?> get props => [product.itemQuantity];
}

class DecreaseProductQuantityEvent extends CartEvent {
  final CartModel product;
  final int ? totalAmount;
  DecreaseProductQuantityEvent({
    required this.product,
     this.totalAmount
  });
  @override
  List<Object?> get props => [product.itemQuantity];
}

// class GetFinalAmount extends CartEvent {
//   final CartModel products;
//   GetFinalAmount({
//     required this.products,
//   });
//   @override
//   List<Object?> get props => [products];
// }