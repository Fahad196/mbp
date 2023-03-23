// ignore_for_file: empty_catches

import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/LoginBloc/login_state.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_events.dart';
import 'package:mybigplate/Blocs/ResturantBloc/resturant_state.dart';
import 'package:mybigplate/Repositories/resturant_repository.dart';

class ResturantBloc extends Bloc<ResturantEvent, ResturantState> {
  ResturantRepository repository;
  ResturantBloc(this.repository) : super(ResturantLoadingState()) {
    on<ResturantLoadEvent>((event, emit) async {
      try {
        final resturant = await repository.getResturants();
        emit(ResturantLoadedState(resturants: resturant));
      } catch (e) {
        emit(ResturantErrorState(message: e.toString()));
      }
    });
  }
}
