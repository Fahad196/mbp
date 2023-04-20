// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:equatable/equatable.dart';

abstract class CartInfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInfoStartEvent extends CartInfoEvent {}

class CartInfoSuccessfulEvent extends CartInfoEvent {
  final tableNo;
  final totalGuest;
  final resturantId;
  String token;

  CartInfoSuccessfulEvent(
      this.tableNo, this.totalGuest, this.resturantId, this.token);
  @override
  List<Object?> get props => [tableNo, totalGuest, resturantId, token];
}

class TableNotBookedEvent extends CartInfoEvent {
  @override
  List<Object?> get props => [];
}
