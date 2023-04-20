import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/cartInfo_model.dart';

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
