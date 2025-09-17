import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../providers/incident_provider.dart';

class PoliceDashboardScreen extends StatefulWidget {
  const PoliceDashboardScreen({Key? key}) : super(key: key);

  @override
  State<PoliceDashboardScreen> createState() => _PoliceDashboardScreenState();
}

class _PoliceDashboardScreenState extends State<PoliceDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final incidentProvider = Provider.of<IncidentProvider>(context);
    final criticalIncidents = incidentProvider.criticalIncidents;
    final assignedCases = incidentProvider.assignedCases;
    final openIncidents = criticalIncidents.length;
    final resolvedToday = incidentProvider.resolvedToday;
    final activeTourists = incidentProvider.activeTourists;
    final avgResponseTime = incidentProvider.avgResponseTime;

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red.shade700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.shield_outlined,
                      size: 36,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Inspector Priya Das',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Police Officer',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Dashboard'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Smart Tourist Safety System'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF7FAFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Police Control Center',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Officer: Inspector Priya Das | Badge: MP001',
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Department',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        Text(
                          'Meghalaya Police',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _statCard(
                    'Active Tourists',
                    activeTourists,
                    Icons.person_outline,
                    Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    'Open Incidents',
                    openIncidents,
                    Icons.warning_amber_rounded,
                    Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _statCard(
                    'Avg Response Time',
                    avgResponseTime == 0.0
                        ? '-'
                        : '${(avgResponseTime / 60).toStringAsFixed(1)} min',
                    Icons.timer,
                    Colors.yellow.shade700,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    'Resolved Today',
                    resolvedToday,
                    Icons.check_circle_outline,
                    Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _sectionTitle('Critical Incidents', criticalIncidents.length),
            ...criticalIncidents
                .map(
                  (incident) => _incidentCardProvider(
                    incident,
                    isCritical: true,
                    incidentProvider: incidentProvider,
                  ),
                )
                .toList(),
            const SizedBox(height: 16),
            _sectionTitle('My Assigned Cases', assignedCases.length),
            ...assignedCases
                .map(
                  (caseData) => _incidentCardProvider(
                    caseData,
                    isCritical: false,
                    isAssigned: true,
                    incidentProvider: incidentProvider,
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, dynamic value, IconData icon, Color color) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          child: Column(
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              Text(
                '$value',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        if (count > 0)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _incidentCardProvider(
    Incident incident, {
    required IncidentProvider incidentProvider,
    bool isCritical = false,
    bool isAssigned = false,
  }) {
    // Determine tag for assigned cases
    String? assignedTag;
    Color? assignedTagColor;
    if (isAssigned) {
      if (incident.status == 'resolved') {
        assignedTag = 'RESOLVED';
        assignedTagColor = Colors.green;
      } else {
        assignedTag = 'INVESTIGATING';
        assignedTagColor = Colors.orange;
      }
    }
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return IncidentDetailsDialogProvider(
              incident: incident,
              isCritical: isCritical,
              isAssigned: isAssigned,
              onAssign:
                  isCritical
                      ? () {
                        incidentProvider.assignIncidentToOfficer(
                          incident,
                          'Inspector Priya Das',
                        );
                        Navigator.pop(context);
                      }
                      : null,
              onResolve:
                  isAssigned && incident.status != 'resolved'
                      ? () {
                        incidentProvider.resolveIncident(incident);
                        Navigator.pop(context);
                      }
                      : null,
            );
          },
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (isCritical)
                        const Icon(
                          Icons.warning_amber_rounded,
                          color: Colors.red,
                          size: 22,
                        ),
                      if (isAssigned)
                        Icon(
                          incident.status == 'resolved'
                              ? Icons.check_circle
                              : Icons.assignment_ind,
                          color:
                              incident.status == 'resolved'
                                  ? Colors.green
                                  : Colors.orange,
                          size: 22,
                        ),
                      const SizedBox(width: 6),
                      Text(
                        incident.touristName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  if (isCritical)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'CRITICAL',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  if (isAssigned && assignedTag != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: assignedTagColor!.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        assignedTag,
                        style: TextStyle(
                          color: assignedTagColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 4),
              Text(incident.description, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 6),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.red, size: 16),
                  const SizedBox(width: 4),
                  Text(incident.location, style: const TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                incident.created,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IncidentDetailsDialogProvider extends StatelessWidget {
  final Incident incident;
  final bool isCritical;
  final bool isAssigned;
  final VoidCallback? onAssign;
  final VoidCallback? onResolve;

  const IncidentDetailsDialogProvider({
    Key? key,
    required this.incident,
    required this.isCritical,
    required this.isAssigned,
    this.onAssign,
    this.onResolve,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Incident Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tourist',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Text(
                        incident.touristName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Digital ID',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Text(
                        incident.digitalId,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Incident Type',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Text(
                        incident.incidentType,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Severity',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isCritical
                                  ? Colors.red.shade100
                                  : Colors.yellow.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isCritical ? 'CRITICAL' : 'MEDIUM',
                          style: TextStyle(
                            color: isCritical ? Colors.red : Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Description',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            Text(
              incident.description,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Location',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            Text(
              incident.location,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Created',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Text(
                        incident.created,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Last Updated',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                      Text(
                        incident.updated,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (isAssigned)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Assigned Officer',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  Text(
                    incident.assignedOfficer ?? 'Inspector Priya Das',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            const SizedBox(height: 18),
            if (onAssign != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: onAssign,
                  child: const Text('Assign to Me', style: TextStyle(color: Colors.white),),
                ),
              ),
            if (onResolve != null)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: onResolve,
                  child: const Text('Mark Resolved', style: TextStyle(color: Colors.white)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
