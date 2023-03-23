import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_state.dart';
import 'package:mybigplate/Models/cart_view_model.dart';
import 'package:mybigplate/Repositories/cart_view_repository.dart';
import 'cart_view_event.dart';

class CartViewBloc extends Bloc<CartViewEvent, CartViewState> {
  CartViewRespository respository;
  CartViewBloc(this.respository) : super(CartViewLoadingState()) {
    on<CartViewLoadingEvent>((event, emit) => emit(CartViewLoadingState()));
    on<CartViewLoadedEvent>((event, emit) async{
      try {
        var data =await respository.getCartList();
        log("data ::::: $data");
        emit(CartViewLoadedState(data));
      } catch (e) {
        emit(CartViewErrorState(e.toString()));
      }
    });
  }
}
