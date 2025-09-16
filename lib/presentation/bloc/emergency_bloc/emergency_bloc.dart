import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:equatable/equatable.dart';

part 'emergency_event.dart';
part 'emergency_state.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> {
  // In a real app, you would inject a repository here.
  // Example: final EmergencyRepository _emergencyRepository;
  // EmergencyBloc(this._emergencyRepository) : super(EmergencyState());
  EmergencyBloc() : super(EmergencyState()) {
    on<PanicButtonPressed>(_onPanicButtonPressed);
  }

  Future<void> _onPanicButtonPressed(
    PanicButtonPressed event,
    Emitter<EmergencyState> emit,
  ) async {
    // Emit 'sending' state to update the UI
    emit(EmergencyState(status: EmergencyStatus.sending));

    try {
      // Simulate API call to send the alert.
      // In a real app, this would be `_emergencyRepository.sendAlert()`.
      await Future.delayed(const Duration(seconds: 2));

      // Emit 'sent' state on success.
      emit(EmergencyState(status: EmergencyStatus.sent));
    } catch (e) {
      // Emit 'initial' state or an 'error' state on failure.
      emit(EmergencyState(status: EmergencyStatus.initial));
    }
  }
}
