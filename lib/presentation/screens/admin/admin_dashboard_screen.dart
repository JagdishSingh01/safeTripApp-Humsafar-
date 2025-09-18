import 'package:flutter/material.dart';
import 'admin_system_settings.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedTab = 0;

  // Mock data for Tourist Management
  final List<Map<String, dynamic>> tourists = [
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

  // Mock data for Geofence Management
  final List<Map<String, dynamic>> geofences = [
    {
      'name': 'Guwahati City Center',
      'type': 'Safe Zone',
      'description':
          'A designated safe area for tourists within the main city.',
      'coordinates': 4,
    },
    {
      'name': 'Cherrapunji Forest Trail',
      'type': 'Risk Zone',
      'description': 'A trail with potential risks, requires a guide.',
      'coordinates': 8,
    },
    {
      'name': 'Assam National Park',
      'type': 'Danger Zone',
      'description': 'Entry is restricted and dangerous due to wildlife.',
      'coordinates': 15,
    },
  ];

  // Helper method to show the tourist form (Create/Update)
  void _showTouristForm(
    BuildContext context, {
    required bool isEdit,
    int? index,
  }) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(
      text: isEdit ? tourists[index!]['name'] ?? '' : '',
    );
    final phoneController = TextEditingController(
      text: isEdit ? tourists[index!]['phone'] ?? '' : '',
    );
    final nationalityController = TextEditingController(
      text: isEdit ? tourists[index!]['nationality'] ?? '' : '',
    );
    final startDateController = TextEditingController(
      text: isEdit ? tourists[index!]['startDate'] ?? '' : '',
    );
    final endDateController = TextEditingController(
      text: isEdit ? tourists[index!]['endDate'] ?? '' : '',
    );
    final destinationsController = TextEditingController(
      text: isEdit ? tourists[index!]['destinations'] ?? '' : '',
    );
    final routesController = TextEditingController(
      text: isEdit ? tourists[index!]['routes'] ?? '' : '',
    );
    final emergencyNameController = TextEditingController(
      text: isEdit ? tourists[index!]['emergencyName'] ?? '' : '',
    );
    final emergencyPhoneController = TextEditingController(
      text: isEdit ? tourists[index!]['emergencyPhone'] ?? '' : '',
    );
    final emergencyRelationController = TextEditingController(
      text: isEdit ? tourists[index!]['emergencyRelation'] ?? '' : '',
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 700,
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isEdit ? 'Edit Tourist Details' : 'Add New Tourist',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty ? 'Name is required' : null,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty ? 'Phone is required' : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: nationalityController,
                            decoration: const InputDecoration(
                              labelText: 'Nationality',
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Nationality is required'
                                        : null,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TextFormField(
                            controller: startDateController,
                            decoration: const InputDecoration(
                              labelText: 'Start Date (DD-MM-YYYY)',
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Start Date is required'
                                        : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: endDateController,
                            decoration: const InputDecoration(
                              labelText: 'End Date (DD-MM-YYYY)',
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'End Date is required'
                                        : null,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TextFormField(
                            controller: destinationsController,
                            decoration: const InputDecoration(
                              labelText: 'Destinations (comma-separated)',
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Destinations are required'
                                        : null,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: routesController,
                      decoration: const InputDecoration(
                        labelText: 'Planned Routes (comma-separated)',
                      ),
                      validator:
                          (value) =>
                              value!.isEmpty ? 'Routes are required' : null,
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Emergency Contact',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: emergencyNameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Emergency Name is required'
                                        : null,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TextFormField(
                            controller: emergencyPhoneController,
                            decoration: const InputDecoration(
                              labelText: 'Phone',
                            ),
                            validator:
                                (value) =>
                                    value!.isEmpty
                                        ? 'Emergency Phone is required'
                                        : null,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: TextFormField(
                            controller: emergencyRelationController,
                            decoration: const InputDecoration(
                              labelText: 'Relationship',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              setState(() {
                                final tourist = {
                                  'name': nameController.text,
                                  'phone': phoneController.text,
                                  'nationality': nationalityController.text,
                                  'startDate': startDateController.text,
                                  'endDate': endDateController.text,
                                  'destinations': destinationsController.text,
                                  'routes': routesController.text,
                                  'emergencyName': emergencyNameController.text,
                                  'emergencyPhone':
                                      emergencyPhoneController.text,
                                  'emergencyRelation':
                                      emergencyRelationController.text,
                                  'digitalId':
                                      isEdit
                                          ? tourists[index!]['digitalId']
                                          : 'DTID-${DateTime.now().year}-NE-${(tourists.length + 1).toString().padLeft(3, '0')}',
                                  'status': 'SAFE',
                                  'score': '90/100',
                                  'expiry': endDateController.text,
                                };
                                if (isEdit) {
                                  tourists[index!] = tourist;
                                } else {
                                  tourists.add(tourist);
                                }
                              });
                              Navigator.pop(context);
                            }
                          },
                          child: Text(isEdit ? 'Save' : 'Create Tourist ID'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to show the delete confirmation dialog for tourists
  void _showDeleteDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Tourist'),
            content: const Text(
              'Are you sure you want to delete this tourist?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() => tourists.removeAt(index));
                  Navigator.pop(context);
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }

  // Helper method to show the geofence form (Create/Update)
  void _showGeofenceForm({required bool isEdit, int? index}) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(
      text: isEdit ? geofences[index!]['name'] : '',
    );
    final descriptionController = TextEditingController(
      text: isEdit ? geofences[index!]['description'] : '',
    );
    final coordinatesController = TextEditingController(
      text: isEdit ? geofences[index!]['coordinates'].toString() : '',
    );
    String? selectedType = isEdit ? geofences[index!]['type'] : 'Safe Zone';

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(24),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        isEdit ? 'Edit Geofence' : 'Add New Geofence',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'Geofence Name',
                    ),
                    validator:
                        (value) => value!.isEmpty ? 'Name is required' : null,
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: selectedType,
                    decoration: const InputDecoration(labelText: 'Type'),
                    items: const [
                      DropdownMenuItem(
                        value: 'Restricted',
                        child: Text('Restricted'),
                      ),
                      DropdownMenuItem(
                        value: 'Risk Zone',
                        child: Text('Risk Zone'),
                      ),
                      DropdownMenuItem(
                        value: 'Danger Zone',
                        child: Text('Danger Zone'),
                      ),
                      DropdownMenuItem(
                        value: 'Safe Zone',
                        child: Text('Safe Zone'),
                      ),
                    ],
                    onChanged: (v) {
                      setState(() {
                        selectedType = v;
                      });
                    },
                    validator:
                        (value) => value == null ? 'Type is required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    maxLines: 2,
                    validator:
                        (value) =>
                            value!.isEmpty ? 'Description is required' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: coordinatesController,
                    decoration: const InputDecoration(
                      labelText: 'Number of Coordinates',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return 'Coordinates are required';
                      if (int.tryParse(value) == null)
                        return 'Please enter a valid number';
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        child: Text(
                          isEdit ? 'Save Changes' : 'Create Geofence',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2563EB),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              final geofenceData = {
                                'name': nameController.text,
                                'description': descriptionController.text,
                                'coordinates':
                                    int.tryParse(coordinatesController.text) ??
                                    0,
                                'type': selectedType ?? 'Safe Zone',
                              };
                              if (isEdit) {
                                geofences[index!] = geofenceData;
                              } else {
                                geofences.add(geofenceData);
                              }
                            });
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Helper method to show the delete confirmation dialog for geofences
  void _showDeleteGeofenceDialog(int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Delete Geofence'),
            content: const Text(
              'Are you sure you want to delete this geofence?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  setState(() => geofences.removeAt(index));
                  Navigator.pop(context);
                },
                child: const Text('Delete'),
              ),
            ],
          ),
    );
  }

  // Helper method for logout functionality
  void _logout(BuildContext context) {
    // TODO: Implement actual logout logic
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple.shade700),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.admin_panel_settings,
                      size: 36,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'System Admin',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Tourist Management'),
              selected: _selectedTab == 0,
              onTap: () {
                setState(() => _selectedTab = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.map),
              title: const Text('Geofence Management'),
              selected: _selectedTab == 1,
              onTap: () {
                setState(() => _selectedTab = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('System Settings'),
              selected: _selectedTab == 2,
              onTap: () {
                setState(() => _selectedTab = 2);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'System Administration',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple.shade700,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedTab,
          children: [
            _buildTouristManagement(),
            _buildGeofenceManagement(),
            _buildSystemSettings(),
          ],
        ),
      ),
    );
  }

  // Widget builder for the Tourist Management tab
  Widget _buildTouristManagement() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return Padding(
          padding: const EdgeInsets.all(18),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Digital Tourist ID Management',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => _showTouristForm(context, isEdit: false),
                      child: const Text('+ Add Tourist'),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minWidth: isMobile ? constraints.maxWidth - 36 : 700,
                        ),
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Digital ID')),
                            DataColumn(label: Text('Name')),
                            DataColumn(label: Text('Nationality')),
                            DataColumn(label: Text('Status')),
                            DataColumn(label: Text('Safety Score')),
                            DataColumn(label: Text('Expiry')),
                            DataColumn(label: Text('Actions')),
                          ],
                          rows: List.generate(tourists.length, (index) {
                            final t = tourists[index];
                            return DataRow(
                              cells: [
                                DataCell(Text(t['digitalId'] ?? '')),
                                DataCell(
                                  Text(
                                    t['name'] ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                DataCell(Text(t['nationality'] ?? '')),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          t['status'] == 'SAFE'
                                              ? Colors.green.shade100
                                              : Colors.red.shade100,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      t['status'] ?? '',
                                      style: TextStyle(
                                        color:
                                            t['status'] == 'SAFE'
                                                ? Colors.green
                                                : Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                                DataCell(Text(t['score'] ?? '')),
                                DataCell(Text(t['expiry'] ?? '')),
                                DataCell(
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.blue,
                                        ),
                                        onPressed:
                                            () => _showTouristForm(
                                              context,
                                              isEdit: true,
                                              index: index,
                                            ),
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                        onPressed:
                                            () => _showDeleteDialog(
                                              context,
                                              index,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget builder for the Geofence Management tab
  Widget _buildGeofenceManagement() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Geofence Management',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () => _showGeofenceForm(isEdit: false),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('+ Add Geofence'),
            ),
          ),
          const SizedBox(height: 16),
          // Dynamically build Geofence Cards from the list
          ...List.generate(geofences.length, (index) {
            final geofence = geofences[index];
            return GeofenceCard(
              name: geofence['name']!,
              type: geofence['type']!,
              description: geofence['description']!,
              coordinates: geofence['coordinates'] as int,
              onEdit: () => _showGeofenceForm(isEdit: true, index: index),
              onDelete: () => _showDeleteGeofenceDialog(index),
            );
          }),
        ],
      ),
    );
  }

  // Widget builder for the System Settings tab
  Widget _buildSystemSettings() {
    return const AdminSystemSettings();
  }
}

/// Helper function to get color based on geofence type
Color _getStatusTagColor(String type) {
  switch (type) {
    case 'Safe Zone':
      return const Color(0xFFD1FAE5);
    case 'Risk Zone':
      return const Color(0xFFFEF3C7);
    case 'Danger Zone':
      return const Color(0xFFFEE2E2);
    case 'Restricted':
      return const Color(0xFFE5E7EB);
    default:
      return Colors.grey.shade200;
  }
}

/// A card widget to display geofence information
class GeofenceCard extends StatelessWidget {
  final String name;
  final String type;
  final String description;
  final int coordinates;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const GeofenceCard({
    required this.name,
    required this.type,
    required this.description,
    required this.coordinates,
    required this.onEdit,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Color(0xFF2563EB)),
                      onPressed: onEdit,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            StatusTag(label: type, color: _getStatusTagColor(type)),
            const SizedBox(height: 12),
            Text(description),
            const SizedBox(height: 8),
            Text(
              '$coordinates coordinate points',
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

/// A small, colored tag widget to show geofence status
class StatusTag extends StatelessWidget {
  final String label;
  final Color color;
  const StatusTag({required this.label, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
      ),
    );
  }
}
