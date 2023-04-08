// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mybigplate/Models/food_category_model.dart';
import '../../Models/dashboard_todaydish_model.dart';

class FoodCategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FoodCategoryLoadingState extends FoodCategoryState {}

class FoodCategoryLoadedstate extends FoodCategoryState {
  List<FoodCategoryModel> hotSellingList;
  FoodCategoryLoadedstate(this.hotSellingList);
  @override
  List<Object?> get props => [hotSellingList];
}

class FoodCategoryErrorState extends FoodCategoryState {
  final String message;
  FoodCategoryErrorState({required this.message});
}
