import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/DashboardMenuBloc/dashboard_menu_event.dart';
import 'package:mybigplate/Blocs/DashboardMenuBloc/dashboard_menu_state.dart';
import 'package:mybigplate/Repositories/dashboard_menu_repository.dart';

class DashboardMenuBloc extends Bloc<DashboardMenuEvent, DashboardMenuState> {
  DashboardMenuRepository repository;
  DashboardMenuBloc(this.repository) : super(DashboardMenuLoadingState()) {
    on<DashboardMenuLoadingEvent>(
        (event, emit) => emit(DashboardMenuLoadingState()));
    on<DashboardMenuLoadedEvent>((event, emit)async {
      final data = await repository.getMenu(event.id);
      try {
        emit(DashboardMenuLoadedstate(data));
      } catch (e) {
        throw e.toString();
      }
    });
  }
}
