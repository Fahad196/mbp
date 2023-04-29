// ignore_for_file: empty_constructor_bodies, avoid_print


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/TableBloc/table_event.dart';
import 'package:mybigplate/Blocs/TableBloc/table_state.dart';
import 'package:mybigplate/Repositories/table_repository.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  TableRepository repository;
  TableBloc(this.repository) : super(TableLoadingState()) {
    on<StartEvent>((event, emit) => emit(TableLoadingState()));

    on<TableLoadedEvent>((event, emit) async {
      try {
        final data = await repository.bookTable(event.id,event.token);
        
        emit(TableLoadedState(tables: data));
      } catch (e) {
        emit(TableErrorState(message: e));
      }
    });
  }
}
