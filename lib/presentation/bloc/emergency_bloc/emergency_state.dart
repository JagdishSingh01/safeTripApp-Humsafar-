part of 'emergency_bloc.dart';

enum EmergencyStatus { initial, sending, sent }

class EmergencyState extends Equatable {
  final EmergencyStatus status;
  const EmergencyState({this.status = EmergencyStatus.initial});

  @override
  List<Object?> get props => [status];
}
