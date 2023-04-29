// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class CartInfoState extends Equatable {
  @override
  List<Object?> get props => [];
}
class CartInfoInitailState extends CartInfoState{}
class CartInfoLoadingState extends CartInfoState {}

class CartInfoSuccessfulstate extends CartInfoState {}

class CartInfoErrorState extends CartInfoState {
  final String message;
  CartInfoErrorState({required this.message});
}
class TableNotBookedState extends CartInfoState{
  @override
  List<Object?> get props => [];
}
