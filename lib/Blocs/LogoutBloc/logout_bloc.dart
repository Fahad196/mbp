
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mybigplate/Blocs/LogoutBloc/logout_state.dart';
import 'package:mybigplate/Repositories/logout_repository.dart';

import 'logout_event.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutRepository repository;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  LogoutBloc(this.repository) : super(LogoutLoadingState()) {
    on<LogoutLoadingEvent>((event, emit) => emit(LogoutLoadingState()));
    on<LogedoutEvent>((event, emit) async {
      var data = await repository.logingOut(event.token);

      try {
        if (data.message == "User logged successfully") {
          storage.deleteAll();
          emit(LogedoutState());
        }
      } catch (e) {
        emit(LogoutErrorState(e.toString()));
      }
    });

    on<NotLoggedOutEvent>((event, emit) => emit(NotLoggedOutState()));
  }
}
