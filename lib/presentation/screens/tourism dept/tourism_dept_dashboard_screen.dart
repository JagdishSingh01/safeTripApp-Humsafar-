import 'package:flutter/material.dart';

class TourismDeptDashboardScreen extends StatefulWidget {
  const TourismDeptDashboardScreen({Key? key}) : super(key: key);

  @override
  State<TourismDeptDashboardScreen> createState() =>
      _TourismDeptDashboardScreenState();
}

class _TourismDeptDashboardScreenState
    extends State<TourismDeptDashboardScreen> {
  // Mock data
  int totalTourists = 15;
  int avgSafetyScore = 75;
  int activeGeofences = 5;
  int upcomingArrivals = 3;
  Map<String, int> regionDistribution = {
    'Meghalaya': 4,
    'Assam': 5,
    'Nagaland': 3,
    'Manipur': 3,
  };
  Map<String, int> safetyScoreDistribution = {
    'Safe (70-100)': 10,
    'Caution (40-69)': 4,
    'High Risk (0-39)': 1,
  };
  List<Map<String, dynamic>> geofences = [
    {
      'name': 'Border Restricted Zone',
      'type': 'RESTRICTED',
      'description':
          'You are approaching a restricted border area. Please contact local authorities.',
      'coordinates': 4,
    },
    {
      'name': 'Risk Zone',
      'type': 'RISK',
      'description': 'Risk zones monitored.',
      'coordinates': 2,
    },
  ];
  List<Map<String, String>> upcomingTourists = [];

  int get maxRegionTourists =>
      regionDistribution.values.fold(0, (a, b) => a > b ? a : b);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.analytics, size: 36, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tourism Dept.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text('Assam, India', style: TextStyle(color: Colors.white70)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Smart Tourist Safety System'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: const Color(0xFFF7FAFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tourism Analytics Dashboard
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Tourism Analytics Dashboard',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ToggleButtons(
                        isSelected: [true, false, false],
                        onPressed: (i) {},
                        borderRadius: BorderRadius.circular(8),
                        selectedColor: Colors.white,
                        fillColor: Colors.blue,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('Today'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('Week'),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Text('Month'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Department: Tourism Department, Assam',
                        style: TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Dashboard Cards
            Row(
              children: [
                Expanded(
                  child: _statCard(
                    'Total Tourists',
                    totalTourists,
                    Icons.people,
                    Colors.blue,
                    '+12% from last month',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    'Avg Safety Score',
                    avgSafetyScore,
                    Icons.trending_up,
                    Colors.green,
                    '+5% from last week',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _statCard(
                    'Active Geofences',
                    activeGeofences,
                    Icons.shield,
                    Colors.orange,
                    'Risk zones monitored',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _statCard(
                    'Upcoming Arrivals',
                    upcomingArrivals,
                    Icons.event,
                    Colors.purple,
                    'Next 7 days',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Tourist Distribution by Region
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              color: const Color(0xFFF8F4FF),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tourist Distribution by Region',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...regionDistribution.entries.map(
                      (entry) =>
                          _regionBar(entry.key, entry.value, maxRegionTourists),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Safety Score Distribution
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              color: const Color(0xFFF8F4FF),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Safety Score Distribution',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...safetyScoreDistribution.entries.map(
                      (entry) => _scoreBar(entry.key, entry.value),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Active Geofences & Risk Zones
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              color: const Color(0xFFF8F4FF),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Active Geofences & Risk Zones',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...geofences.map((g) => _geofenceCard(g)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Upcoming Tourist Arrivals
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
              color: const Color(0xFFF8F4FF),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Upcoming Tourist Arrivals',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _upcomingArrivalsTable(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(
    String title,
    int value,
    IconData icon,
    Color color,
    String subtitle,
  ) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withAlpha(30),
              color.withAlpha(30),
              color.withAlpha(30),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color.withAlpha(30),
                child: Icon(icon, color: color, size: 24),
                radius: 22,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$value',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: color.withAlpha(200)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _regionBar(String region, int value, int maxValue) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(width: 90, child: Text(region)),
          Expanded(
            child: LinearProgressIndicator(
              value: maxValue == 0 ? 0 : value / maxValue,
              minHeight: 8,
              backgroundColor: Colors.blue.shade100,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ),
          const SizedBox(width: 12),
          Text('$value tourists', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _scoreBar(String label, int value) {
    Color barColor;
    if (label.startsWith('Safe')) {
      barColor = Colors.green;
    } else if (label.startsWith('Caution')) {
      barColor = Colors.yellow.shade700;
    } else {
      barColor = Colors.red;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(width: 110, child: Text(label)),
          Expanded(
            child: LinearProgressIndicator(
              value: value / 15,
              minHeight: 8,
              backgroundColor: barColor.withAlpha(60),
              valueColor: AlwaysStoppedAnimation<Color>(barColor),
            ),
          ),
          const SizedBox(width: 12),
          Text('$value tourists', style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _geofenceCard(Map<String, dynamic> g) {
    Color tagColor =
        g['type'] == 'RESTRICTED' ? Colors.yellow.shade700 : Colors.orange;
    String tagLabel = g['type'] == 'RESTRICTED' ? 'RESTRICTED' : 'RISK';
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  g['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withAlpha(60),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tagLabel,
                    style: TextStyle(
                      color: tagColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(g['description'], style: const TextStyle(fontSize: 13)),
            const SizedBox(height: 4),
            Text(
              'Coordinates: ${g['coordinates']} points defined',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _upcomingArrivalsTable() {
    if (upcomingTourists.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text(
          'No upcoming arrivals in the next 7 days',
          style: TextStyle(color: Colors.grey),
        ),
      );
    }
    return DataTable(
      columns: const [
        DataColumn(label: Text('Tourist Name')),
        DataColumn(label: Text('Nationality')),
        DataColumn(label: Text('Arrival Date')),
        DataColumn(label: Text('Destination')),
      ],
      rows:
          upcomingTourists.map((t) {
            return DataRow(
              cells: [
                DataCell(Text(t['name'] ?? '')),
                DataCell(Text(t['nationality'] ?? '')),
                DataCell(Text(t['arrivalDate'] ?? '')),
                DataCell(Text(t['destination'] ?? '')),
              ],
            );
          }).toList(),
    );
  }
}
