// ignore_for_file: unused_local_variable, unrelated_type_equality_checks, file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/CartInfoBloc/cartInfo_event.dart';
import 'package:mybigplate/Blocs/CartInfoBloc/cartInfo_state.dart';
import 'package:mybigplate/Repositories/cartInfo_repository.dart';

class CartInfoBloc extends Bloc<CartInfoEvent, CartInfoState> {
  CartInfoRepository repository;
  CartInfoBloc(this.repository) : super(CartInfoInitailState()) {
    on<CartInfoStartEvent>((event, emit) => emit(CartInfoInitailState()));
    on<CartInfoSuccessfulEvent>((event, emit) async {
      emit(CartInfoLoadingState());
      try {
        final data = await repository.getTableInfo(
            event.tableNo, event.totalGuest, event.resturantId, event.token);
        if (data.message == 'Table Booked Successfully') {
          emit(CartInfoSuccessfulstate());
        } else {
          emit(CartInfoErrorState(message: "already booked"));
        }
      } catch (e) {
        emit(CartInfoErrorState(message: e.toString()));
      }
    });
    on<TableNotBookedEvent>((event, emit) => emit(TableNotBookedState()));
  }
}
