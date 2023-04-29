import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class CartViewEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartViewLoadingEvent extends CartViewEvent {}

class CartViewLoadedEvent extends CartViewEvent {
  final String token;
  final int resId;
  CartViewLoadedEvent(
    this.token,
    this.resId,
  );
  @override
  List<Object?> get props => [token, resId];
}

// class InitailQuantityEvent extends CartViewEvent{
// }
// class UpdateQuantityCartLoadingEvent extends CartViewEvent{

// }

// class IncreaseItemQuantityCartEvent extends CartViewEvent{
//   final int cartId;
//   final int itemPrice;
//  final int itemQuantity;
//  final int resturantId;
//  final String portion;
//  final String token;
// IncreaseItemQuantityCartEvent({required this.cartId,required this.itemPrice,required this.itemQuantity,required this.resturantId,required this.portion,required this.token});
// }

// class DecreaseItemQuantityCartEvent extends CartViewEvent{
//   final int cartId;
//   final int itemPrice;
//  final int itemQuantity;
//  final int resturantId;
//  final String portion;
//  final String token;
// DecreaseItemQuantityCartEvent({required this.cartId,required this.itemPrice,required this.itemQuantity,required this.resturantId,required this.portion,required this.token});
// }

class RefreshCartViewEvent extends CartViewEvent {
  @override
  List<Object?> get props => [];
}
