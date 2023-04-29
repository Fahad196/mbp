import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/OrderSummaryBloc/order_summary_event.dart';
import 'package:mybigplate/Repositories/order_summary_repository.dart';

import 'order_summary_state.dart';

class OrderSummaryBloc extends Bloc<OrderSummaryEvent, OrderSummaryState> {
  OrderSummaryRepository repository;
  OrderSummaryBloc(this.repository) : super(OrderSummaryLoadingState()) {
    on<OrderSummaryLoadingEvent>(
        (event, emit) => emit(OrderSummaryLoadingState()));
    on<OrderSummaryLoadedEvent>((event, emit)async {
      var data =await repository.getOrderSummary(event.token);
      try {
        emit(OrderSummaryLoadedState(data));
      } catch (e) {
        emit(OrderSummaryErrorState(e.toString()));
      }
    });
  }
}
