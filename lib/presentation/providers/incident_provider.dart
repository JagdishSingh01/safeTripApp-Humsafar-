import 'package:flutter/material.dart';

class Incident {
  final String incidentId;
  final String touristName;
  final String digitalId;
  final String incidentType;
  final String severity;
  final String description;
  final String location;
  final String created;
  final String updated;
  final String? assignedOfficer;
  final String status;

  Incident({
    required this.incidentId,
    required this.touristName,
    required this.digitalId,
    required this.incidentType,
    required this.severity,
    required this.description,
    required this.location,
    required this.created,
    required this.updated,
    this.assignedOfficer,
    this.status = 'open',
  });
}

class IncidentProvider extends ChangeNotifier {
  final List<Incident> _criticalIncidents = [];
  final List<Incident> _assignedCases = [];

  int _resolvedToday = 0;
  List<Map<String, dynamic>> _tourists = [
    {
      'digitalId': 'DTID-2024-NE-001',
      'name': 'Sarah Johnson',
      'phone': '9876543210',
      'nationality': 'USA',
      'status': 'SAFE',
      'score': '92/100',
      'expiry': '12/22/2024',
      'startDate': '01-12-2024',
      'endDate': '12-22-2024',
      'destinations': 'Meghalaya, Assam',
      'routes': 'Guwahati, Shillong, Cherrapunji',
      'emergencyName': 'John Johnson',
      'emergencyPhone': '1234567890',
      'emergencyRelation': 'Parent',
    },
    {
      'digitalId': 'DTID-2024-NE-002',
      'name': 'Hiroshi Tanaka',
      'phone': '8765432109',
      'nationality': 'Japan',
      'status': 'SAFE',
      'score': '95/100',
      'expiry': '12/21/2024',
      'startDate': '01-11-2024',
      'endDate': '12-21-2024',
      'destinations': 'Assam',
      'routes': 'Guwahati',
      'emergencyName': 'Yuki Tanaka',
      'emergencyPhone': '2345678901',
      'emergencyRelation': 'Spouse',
    },
  ];

  List<Map<String, dynamic>> get tourists => List.unmodifiable(_tourists);
  int get activeTourists => _tourists.length;

  void addTourist(Map<String, dynamic> tourist) {
    _tourists.add(tourist);
    notifyListeners();
  }

  void editTourist(int index, Map<String, dynamic> tourist) {
    if (index >= 0 && index < _tourists.length) {
      _tourists[index] = tourist;
      notifyListeners();
    }
  }

  void removeTourist(int index) {
    if (index >= 0 && index < _tourists.length) {
      _tourists.removeAt(index);
      notifyListeners();
    }
  }

  List<int> _responseTimes = [];

  List<Incident> get criticalIncidents => List.unmodifiable(_criticalIncidents);
  List<Incident> get assignedCases => List.unmodifiable(_assignedCases);
  int get resolvedToday => _resolvedToday;
  // int get activeTourists => _activeTourists; // Remove old getter, now based on _tourists.length
  double get avgResponseTime {
    if (_responseTimes.isEmpty) return 0.0;
    return _responseTimes.reduce((a, b) => a + b) / _responseTimes.length;
  }

  void addCriticalIncident(Incident incident) {
    _criticalIncidents.add(incident);
    notifyListeners();
  }

  void assignIncidentToOfficer(Incident incident, String officer) {
    // Use incidentId for assignment
    final idx = _assignedCases.indexWhere(
      (i) => i.incidentId == incident.incidentId,
    );
    final canAssign = idx == -1 || (_assignedCases[idx].status == 'resolved');
    if (canAssign) {
      _assignedCases.add(
        Incident(
          incidentId: incident.incidentId,
          touristName: incident.touristName,
          digitalId: incident.digitalId,
          incidentType: incident.incidentType,
          severity: incident.severity,
          description: incident.description,
          location: incident.location,
          created: incident.created,
          updated: DateTime.now().toString(),
          assignedOfficer: officer,
          status: 'investigating',
        ),
      );
      // Calculate response time (seconds between created and now)
      try {
        final created = DateTime.parse(incident.created);
        final now = DateTime.now();
        final seconds = now.difference(created).inSeconds;
        _responseTimes.add(seconds);
      } catch (_) {}
    }
    notifyListeners();
  }

  void resolveIncident(Incident incident) {
    // Mark as resolved in assignedCases using incidentId
    final idx = _assignedCases.indexWhere(
      (i) => i.incidentId == incident.incidentId,
    );
    if (idx != -1) {
      _assignedCases[idx] = Incident(
        incidentId: incident.incidentId,
        touristName: incident.touristName,
        digitalId: incident.digitalId,
        incidentType: incident.incidentType,
        severity: incident.severity,
        description: incident.description,
        location: incident.location,
        created: incident.created,
        updated: DateTime.now().toString(),
        assignedOfficer: incident.assignedOfficer,
        status: 'resolved',
      );
    }
    // Remove from critical incidents using incidentId
    _criticalIncidents.removeWhere((i) => i.incidentId == incident.incidentId);
    _resolvedToday++;
    notifyListeners();
  }
}
