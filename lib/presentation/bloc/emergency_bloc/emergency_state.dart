part of 'emergency_bloc.dart';

enum EmergencyStatus { initial, sending, sent }

class EmergencyState {
  final EmergencyStatus status;
  EmergencyState({this.status = EmergencyStatus.initial});
}