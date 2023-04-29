import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/update_quantity_cart_model.dart';

abstract class UpdateQuantityCartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialQuantityState extends UpdateQuantityCartState {}

class UpdateQuantityCartLoadingState extends UpdateQuantityCartState {}

class IncreaseItemQuantityCartState extends UpdateQuantityCartState {
  final UpdateQuantityCartModel quantityCartModel;
  IncreaseItemQuantityCartState({required this.quantityCartModel});
  @override
  List<Object?> get props => [quantityCartModel];
}

class DecreaseItemQuantityCartState extends UpdateQuantityCartState {
  final UpdateQuantityCartModel quantityCartModel;
  DecreaseItemQuantityCartState({required this.quantityCartModel});
  @override
  List<Object?> get props => [quantityCartModel];
}

class RefreshQuantityState extends UpdateQuantityCartState {
  @override
  List<Object?> get props => [];
}

class UpdateQuantityCartErrorState extends UpdateQuantityCartState {
  final String message;
  UpdateQuantityCartErrorState(this.message);
}
