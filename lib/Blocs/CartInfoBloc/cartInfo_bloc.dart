// ignore_for_file: unused_local_variable, unrelated_type_equality_checks

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/CartInfoBloc/cartInfo_event.dart';
import 'package:mybigplate/Blocs/CartInfoBloc/cartInfo_state.dart';
import 'package:mybigplate/Models/cartInfo_model.dart';
import 'package:mybigplate/Repositories/cartInfo_repository.dart';

class CartInfoBloc extends Bloc<CartInfoEvent, CartInfoState> {
  CartInfoRepository repository;
  CartInfoBloc(this.repository) : super(CartInfoLoadingState()) {
    on<CartInfoStartEvent>((event, emit) => emit(CartInfoLoadingState()));

    on<CartInfoSuccessfulEvent>((event, emit) async {
      try {
        final data = await repository.getTableInfo(
            event.tableNo, event.totalGuest, event.resturantId);

        if (data.message == 'Table Booked Successfully') {
          emit(CartInfoSuccessfulstate());
        } else {
          emit(CartInfoErrorState(message: "already booked"));
        }
      } catch (e) {
       
        emit(CartInfoErrorState(message: e.toString()));
      }
    });
  }
}
