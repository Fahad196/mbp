// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/OrderNowBloc/order_now_event.dart';
import 'package:mybigplate/Blocs/OrderNowBloc/order_now_state.dart';
import 'package:mybigplate/Repositories/order_now_repository.dart';

class OrderNowBloc extends Bloc<OrderNowEvent, OrderNowState> {
  OrderNowRepository repository;
  OrderNowBloc(this.repository) : super(OrderNowLoadingState()) {
    on<OrderNowLoadingEvent>((event, emit) => emit(OrderNowLoadingState()));
    on<OrderedEvent>((event, emit) async {
      var data = await repository.getProfile(event.token, event.resId,event.grandTotal);
      try {
        if (data.message == "ORDERED") {
          emit(OrderedState(data.message.toString()));
        } else {
          emit(OrderErrorState("Somthing went wrong"));
        }
      } catch (e) {
        log(e.toString());
        emit(OrderErrorState(e.toString()));
      }
    });
    on<OrderFinishedEvent>((event, emit) => emit(OrderFinishedState()));
  }
}
