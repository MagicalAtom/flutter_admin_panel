import 'package:bloc/bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<openDashBoardTab>((event, emit) {
      emit(DashboardTabIndexState(tab: event.tab));
    });
  }
}
