import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/ProfileBloc/profile_event.dart';
import 'package:mybigplate/Blocs/ProfileBloc/profile_state.dart';
import 'package:mybigplate/Repositories/profile_repository.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository repository;
  ProfileBloc(this.repository) : super(ProfileLoadingState()) {
    on<ProfileLoadingEvent>((event, emit) => emit(ProfileLoadingState()));
    on<ProfileLoadedEvent>((event, emit) async {
      var data = await repository.getProfile(event.token);

      try {
        emit(ProfileLoadedState(data));
      } catch (e) {
        emit(ProfileErrorState("Something went wrong"));
      }
    });
  }
}
