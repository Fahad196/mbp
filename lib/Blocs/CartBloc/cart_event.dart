// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

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
      @override

  List<Object?> get props => [itemId,itemPrice,itemQuantity,categoryId,resturantId,type,Portion,token];
}
