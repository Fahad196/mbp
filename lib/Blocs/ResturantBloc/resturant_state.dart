import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/resturant_model.dart';

class ResturantState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResturantLoadingState extends ResturantState {}

class ResturantLoadedState extends ResturantState {
  final List<ResturantModel> resturants;
  ResturantLoadedState({required this.resturants});
  @override
  List<Object?> get props=>[resturants];
}

class ResturantErrorState extends ResturantState {
  final String message;
  ResturantErrorState({required this.message});
}
