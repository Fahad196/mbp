// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';

class CartInfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInfoStartEvent extends CartInfoEvent {}

class CartInfoSuccessfulEvent extends CartInfoEvent {
  final tableNo;
  final totalGuest;
  final resturantId;

  CartInfoSuccessfulEvent(this.tableNo, this.totalGuest, this.resturantId);
  
}
