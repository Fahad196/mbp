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
  final String token;
  AddToCartEvent(this.itemId, this.itemPrice, this.itemQuantity,
      this.categoryId, this.resturantId, this.type, this.Portion,this.token);
}


// class GetFinalAmount extends CartEvent {
//   final CartModel products;
//   GetFinalAmount({
//     required this.products,
//   });
//   @override
//   List<Object?> get props => [products];
// }