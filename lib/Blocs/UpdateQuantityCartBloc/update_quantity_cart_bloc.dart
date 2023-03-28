

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_event.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_state.dart';
import 'package:mybigplate/Repositories/update_quantity_cart_repository.dart';

class UpdateQuantityCartBloc
    extends Bloc<UpdateQuantityCartEvent, UpdateQuantityCartState> {
  UpadteQuantityCartRepository repository;
  UpdateQuantityCartBloc(this.repository)
      : super(UpdateQuantityCartLoadingState()) {
    on<UpdateQuantityCartLoadingEvent>(
        (event, emit) => emit(UpdateQuantityCartLoadingState()));
    on<UpdateItemQuantityCartEvent>((event, emit)async {
      try {
        final data =await repository.updateQuantity(event.itemId, event.itemPrice,
            event.itemQuantity, event.resturantId, event.portion);
            emit(UpdateItemQuantityCartState(data));
      } catch (e) {
        log(e.toString());
        emit(UpdateQuantityCartErrorState(e.toString()));
      }
    });
  }
}
