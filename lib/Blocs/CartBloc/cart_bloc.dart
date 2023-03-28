// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_event.dart';
import 'package:mybigplate/Blocs/CartBloc/cart_state.dart';
import 'package:mybigplate/Repositories/cartInfo_repository.dart';

import '../../Models/cart_model.dart';
import '../../Repositories/cart_respository.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRespository repository;
  CartBloc(this.repository) : super(CartLoadingState()) {
    on<CartLoadingEvent>((event, emit) => emit(CartLoadingState()));
    on<AddToCartEvent>((event, emit) async{
      try {
        final data = await repository.addToCart(event.itemId, event.itemPrice,
            event.itemQuantity, event.categoryId, event.resturantId,event.type,event.Portion);
        emit(AddToCartState(products: data as List<CartModel>));
      } catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });
    on<IncreaseProductQuantityEvent>((event, emit) {
    
    } );
  }
}
