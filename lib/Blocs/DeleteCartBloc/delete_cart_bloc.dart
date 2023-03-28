// ignore_for_file: unused_local_variable

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/DeleteCartBloc/delete_cart_event.dart';
import 'package:mybigplate/Blocs/DeleteCartBloc/delete_cart_state.dart';
import 'package:mybigplate/Repositories/delete_cart_repository.dart';

class DeleteCartBloc extends Bloc<DeleteCartEvent, DeleteCartState> {
  DeleteCartRepository repository;
  DeleteCartBloc(this.repository) : super(DeleteCartLoadingState()) {
    on<DeleteCartLoadingEvent>((event, emit) => emit(DeleteCartLoadingState()));
    on<DeleteItemCartEvent>((event, emit) {
      var data = repository.deleteCartItems(
          event.itemId, event.resturantId, event.portion);
      try {
        emit(DeleteItemCartState());
      } catch (e) {
        emit(DeleteCartErrorState(e.toString()));
      }
    });
  }
}
