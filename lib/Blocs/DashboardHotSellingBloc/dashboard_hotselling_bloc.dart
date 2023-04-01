import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_event.dart';
import 'package:mybigplate/Blocs/DashboardHotSellingBloc/dashboard_hotselling_state.dart';
import 'package:mybigplate/Repositories/dashboard_hotselling_respository.dart';

class DashboardHotSellingBloc
    extends Bloc<DashboardHotSellingEvent, DashboardHotSellingState> {
  DashboardHotSellingRepository repository;
  DashboardHotSellingBloc(this.repository)
      : super(DashboardHotSellingLoadingState()) {
    on<DashboardHotSellingLoadingEvent>(
        (event, emit) => emit(DashboardHotSellingLoadingState()));
    on<DashboardHotSellingLoadedEvent>((event, emit)async {
    
      var data = await repository.getHotSellings(event.id,event.token);
      try {
        emit(DashboardHotSellingLoadedstate(data));
      
      } catch (e) {
       
        throw e.toString();
      }
    });
  }
}
