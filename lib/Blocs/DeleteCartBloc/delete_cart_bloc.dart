// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/DeleteCartBloc/delete_cart_event.dart';
import 'package:mybigplate/Blocs/DeleteCartBloc/delete_cart_state.dart';
import 'package:mybigplate/Repositories/delete_cart_repository.dart';

class DeleteCartBloc extends Bloc<DeleteCartEvent, DeleteCartState> {
  DeleteCartRepository repository;
  DeleteCartBloc(this.repository) : super(DeleteCartLoadingState()) {
    on<DeleteCartLoadingEvent>((event, emit) => emit(DeleteCartLoadingState()));
    on<DeleteItemCartEvent>((event, emit) async {
      var data = await repository.deleteCartItems(
          event.cartId, event.resturantId, event.portion, event.token);
      try {
        if (data['message'] == "Item Delete") {
          emit(DeleteItemCartState());
        } else {
          emit(DeleteCartErrorState("somthing went wrong"));
        }
      } catch (e) {
        emit(DeleteCartErrorState(e.toString()));
      }
    });
  }
}
