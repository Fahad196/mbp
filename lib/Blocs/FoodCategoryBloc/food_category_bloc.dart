// ignore_for_file: empty_catches, unrelated_type_equality_checks

import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_event.dart';
import 'package:mybigplate/Blocs/FoodCategoryBloc/food_category_state.dart';
import 'package:mybigplate/Repositories/food_category_repository.dart';

class FoodCategoryBloc extends Bloc<FoodCategoryEvent, FoodCategoryState> {
  FoodCategoryRepository repository;
  FoodCategoryBloc(this.repository) : super(FoodCategoryLoadingState()) {
    on<FoodCategoryLoadingEvent>(
        (event, emit) => emit(FoodCategoryLoadingState()));
    on<FoodCategoryLoadedEvent>((event, emit) async {
      final products = await repository.getCatogories(event.resId, event.catId,event.token);
     // log("products::::::::::::::::::::::::::::: $products");
      try {
        if (products.where((element) => element.categoryId==event.catId && element.resturantId == event.resId).isEmpty) {
         // log("XXXXXXXXXXXXXXXXXXXXXXXXXXX ${event.catId.toString()}");
          emit(FoodCategoryLoadedstate(products));
        } else {
          emit(FoodCategoryErrorState(message: "No item added yet"));
        }
      } catch (e) {
        log("Error ::::::::::: $e");
       emit(FoodCategoryErrorState(message: e.toString()));
      }
    });
  }
}
