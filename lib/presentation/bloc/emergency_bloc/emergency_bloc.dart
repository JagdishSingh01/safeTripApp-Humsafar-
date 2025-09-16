import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'emergency_event.dart';
part 'emergency_state.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  EmergencyBloc() : super(const EmergencyState()) {
    on<PanicButtonPressed>(_onPanicButtonPressed);
  }

  Future<void> _onPanicButtonPressed(
    PanicButtonPressed event,
    Emitter<EmergencyState> emit,
  ) async {
    emit(const EmergencyState(status: EmergencyStatus.sending));
    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(const EmergencyState(status: EmergencyStatus.sent));
    } catch (e) {
      emit(const EmergencyState(status: EmergencyStatus.initial));
    }
  }
}
