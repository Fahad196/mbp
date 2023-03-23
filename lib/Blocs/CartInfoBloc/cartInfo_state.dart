import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/cartInfo_model.dart';

class CartInfoState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CartInfoLoadingState extends CartInfoState {}

class CartInfoSuccessfulstate extends CartInfoState {}

class CartInfoErrorState extends CartInfoState {
  String message;
  CartInfoErrorState({required this.message});
}
