import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/OrderDetailsBloc/order_detail_event.dart';
import 'package:mybigplate/Blocs/OrderDetailsBloc/order_detail_state.dart';
import 'package:mybigplate/Repositories/order_detail_repository.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailRepository repository;
  OrderDetailBloc(this.repository) : super(OrderDetailLoadingState()) {
    on<OrderDetailLoadingEvent>(
        (event, emit) => emit(OrderDetailLoadingState()));
    on<OrderDetailLoadedEvent>((event, emit)async {
      var data =await repository.getCatogories(event.orderId, event.token);
      try {
        emit(OrderDetailLoadedState(data));
      } catch (e) {
        emit(OrderDetailErrorState(e.toString()));
      }
    });
  }
}
