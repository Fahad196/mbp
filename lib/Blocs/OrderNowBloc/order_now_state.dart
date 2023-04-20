// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/order_now_model.dart';

abstract class OrderNowState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OrderNowLoadingState extends OrderNowState {}

class OrderedState extends OrderNowState {
  final String orders;
  OrderedState(this.orders);
  @override
  List<Object?> get props => [orders];
}

class OrderErrorState extends OrderNowState {
  String message;
  OrderErrorState(this.message);
}
class OrderFinishedState extends OrderNowState{
  @override
  List<Object?> get props => [];
}