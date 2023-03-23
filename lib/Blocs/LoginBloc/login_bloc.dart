// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, unused_local_variable, void_checks, avoid_print, unrelated_type_equality_checks

import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Repositories/login_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository repository;
  var storage = FlutterSecureStorage();
  LoginBloc(this.repository) : super(LoginInitailState()) {
    on<StartEvent>((event, emit) => emit(LoginInitailState()));
    on<LoginButtonPressedEvent>((event, emit) async {
      emit(LoginLoadingState());
      var data = await repository.LogingIn(event.email, event.password);

      try {
        if (data['access_token'] != null) {
          //here we saved the token
          var token = storage.write(key: "token", value: data['access_token']);

          emit(LoginSuccess(token: '${data['token']}'));
        } else if (data['status'] == 108) {
          emit(LoginErrorState("Invalid Username or Password"));
        }
      } catch (e) {
        emit(LoginErrorState(e.toString()));
      }
    });
  }
}
