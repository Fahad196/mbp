
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_event.dart';
import 'package:mybigplate/Blocs/DashboardTodayDishBloc.dart/dashboard_todaydish_state.dart';
import 'package:mybigplate/Repositories/dasboard_todaydish_repository.dart';

class DashboardTodayDishBloc
    extends Bloc<DashboardTodayDishEvent, DashboardTodayDishState> {
  DashboardTodayDishRepository repository;
  DashboardTodayDishBloc(this.repository)
      : super(DashboardTodayDishLoadingState()) {
    on<DashboardTodayDishLoadingEvent>(
        (event, emit) => emit(DashboardTodayDishLoadingState()));
    on<DashboardTodayDishLoadedEvent>((event, emit)async {
    
      var data = await repository.getTodayDish(event.resId,event.token);
  
     
      try {
        emit(DashboardTodayDishLoadedstate(data));
      
      } catch (e) {
      print(e);
        throw e.toString();
      }
    });
  }
}
