import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mybigplate/Blocs/LoginBloc/login_state.dart';
import 'package:mybigplate/Blocs/LogoutBloc/logout_state.dart';
import 'package:mybigplate/Repositories/logout_repository.dart';

import 'logout_event.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutRepository repository;
  FlutterSecureStorage storage=FlutterSecureStorage();
  LogoutBloc(this.repository) : super(LogoutLoadingState()) {
    on<LogoutLoadingEvent>((event, emit) => emit(LogoutLoadingState()));
    on<LogedoutEvent>((event, emit) async {
      var data = await repository.logingOut(event.token);
      log("data ::::::::$data");
      try {
        if(data.message=="User logged successfully"){
        emit(LogedoutState());
        }
       
      } catch (e) {
        emit(LogoutErrorState(e.toString()));
      }
    });
  }
}
