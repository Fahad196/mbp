import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_event.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_state.dart';
import 'package:mybigplate/Models/update_quantity_cart_model.dart';
import 'package:mybigplate/Repositories/update_quantity_cart_repository.dart';

class UpdateQuantityCartBloc
    extends Bloc<UpdateQuantityCartEvent, UpdateQuantityCartState> {
  UpadteQuantityCartRepository repository;
  UpdateQuantityCartBloc(this.repository)
      : super(UpdateQuantityCartLoadingState()) {
    on<UpdateQuantityCartLoadingEvent>(
        (event, emit) => emit(UpdateQuantityCartLoadingState()));
    on<UpdateItemQuantityCartEvent>((event, emit) async {
      try {
        final data = await repository.updateQuantity(
            event.cartId,
            event.itemPrice,
            event.itemQuantity,
            event.resturantId,
            event.portion,event.token);
        if (data.message =="Item Updated Successfully") {
          emit(UpdateItemQuantityCartState(quantityCartModel: data));
        } else {
          emit(UpdateQuantityCartErrorState("something went wrong"));
        }
      } catch (e) {
        log(e.toString());
        emit(UpdateQuantityCartErrorState(e.toString()));
      }
    });
  }
}
