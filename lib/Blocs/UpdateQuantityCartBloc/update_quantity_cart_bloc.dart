import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_bloc.dart';
import 'package:mybigplate/Blocs/CartViewBloc/cart_view_event.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_event.dart';
import 'package:mybigplate/Blocs/UpdateQuantityCartBloc/update_quantity_cart_state.dart';
import 'package:mybigplate/Models/update_quantity_cart_model.dart';
import 'package:mybigplate/Repositories/update_quantity_cart_repository.dart';

class UpdateQuantityCartBloc
    extends Bloc<UpdateQuantityCartEvent, UpdateQuantityCartState> {
  UpadteQuantityCartRepository repository;
  UpdateQuantityCartBloc(this.repository) : super(InitialQuantityState()) {
    on<InitailQuantityEvent>((event, emit) => emit(InitialQuantityState()));
    on<IncreaseItemQuantityCartEvent>((event, emit) async {
      emit(UpdateQuantityCartLoadingState());
      try {
        final UpdateQuantityCartModel data = await repository.updateQuantity(
          event.cartId,
          event.itemPrice,
          event.itemQuantity,
          event.resturantId,
          event.portion,
          event.token,
        );
        // log('Increase quantity from bloc: ${data!.quantity}');
        BlocProvider.of<CartViewBloc>(event.context).add(
          CartViewLoadedEvent(
            event.token,
            event.resId,
          ),
        );
        emit(IncreaseItemQuantityCartState(quantityCartModel: data));
      } catch (e) {
        log(e.toString());
        emit(UpdateQuantityCartErrorState(e.toString()));
      }
    });
    on<DecreaseItemQuantityCartEvent>((event, emit) async {
      emit(UpdateQuantityCartLoadingState());
      try {
        final data = await repository.updateQuantity(
            event.cartId,
            event.itemPrice,
            event.itemQuantity,
            event.resturantId,
            event.portion,
            event.token);

        emit(DecreaseItemQuantityCartState(quantityCartModel: data));
      } catch (e) {
        log(e.toString());
        emit(UpdateQuantityCartErrorState(e.toString()));
      }
    });
    on<RefreshQuantityEvent>((event, emit) => emit(RefreshQuantityState()));
  }
}
