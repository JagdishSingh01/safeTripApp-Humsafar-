part of 'emergency_bloc.dart';

abstract class EmergencyEvent extends Equatable {
  const EmergencyEvent();
  @override
  List<Object?> get props => [];
}

class PanicButtonPressed extends EmergencyEvent {
  const PanicButtonPressed();
}
