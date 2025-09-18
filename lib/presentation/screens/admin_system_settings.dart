// import 'package:flutter/material.dart';

// class AdminSystemSettings extends StatefulWidget {
//   const AdminSystemSettings({Key? key}) : super(key: key);

//   @override
//   State<AdminSystemSettings> createState() => _AdminSystemSettingsState();
// }

// class _AdminSystemSettingsState extends State<AdminSystemSettings> {
//   double anomalyThreshold = 0.5;
//   final TextEditingController _safetyScoreIntervalController = TextEditingController(text: '30');
//   bool enableSms = true;
//   bool enableEmail = true;
//   bool enableRealtime = true;
//   bool networkConnected = true;
//   int totalDtids = 2;
//   int lastBlock = 12847;

//   @override
//   void dispose() {
//     _safetyScoreIntervalController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Card(
//         elevation: 3,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//         child: Padding(
//           padding: const EdgeInsets.all(24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'System Configuration',
//                 style: Theme.of(context).textTheme.headlineSmall,
//               ),
//               const SizedBox(height: 24),
              
//               // AI Model Settings Section
//               Text(
//                 'AI Model Settings',
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               const SizedBox(height: 8),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 title: const Text('Anomaly Detection Threshold'),
//                 subtitle: Slider(
//                   value: anomalyThreshold,
//                   min: 0,
//                   max: 1,
//                   divisions: 100,
//                   label: anomalyThreshold.toStringAsFixed(2),
//                   onChanged: (v) => setState(() => anomalyThreshold = v),
//                 ),
//                 trailing: Text(anomalyThreshold.toStringAsFixed(2)),
//               ),
//               const SizedBox(height: 8),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 title: const Text('Safety Score Update Interval (seconds)'),
//                 trailing: SizedBox(
//                   width: 80,
//                   child: TextField(
//                     controller: _safetyScoreIntervalController,
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.end,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       isDense: true,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                     ),
//                     onChanged: (v) => setState(() {
//                       // We don't need to do anything here since the controller is handling the text
//                     }),
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 24),

//               // Alert Settings Section
//               Text(
//                 'Alert Settings',
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               CheckboxListTile(
//                 value: enableSms,
//                 onChanged: (v) => setState(() => enableSms = v ?? false),
//                 title: const Text('Enable SMS Alerts'),
//                 controlAffinity: ListTileControlAffinity.leading,
//                 contentPadding: EdgeInsets.zero,
//               ),
//               CheckboxListTile(
//                 value: enableEmail,
//                 onChanged: (v) => setState(() => enableEmail = v ?? false),
//                 title: const Text('Enable Email Notifications'),
//                 controlAffinity: ListTileControlAffinity.leading,
//                 contentPadding: EdgeInsets.zero,
//               ),
//               CheckboxListTile(
//                 value: enableRealtime,
//                 onChanged: (v) => setState(() => enableRealtime = v ?? false),
//                 title: const Text('Real-time Dashboard Updates'),
//                 controlAffinity: ListTileControlAffinity.leading,
//                 contentPadding: EdgeInsets.zero,
//               ),

//               const SizedBox(height: 24),
              
//               // Blockchain Settings Section
//               Text(
//                 'Blockchain Settings',
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               const SizedBox(height: 12),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 leading: Icon(
//                   networkConnected ? Icons.link : Icons.link_off,
//                   color: networkConnected ? Colors.green : Colors.red,
//                 ),
//                 title: const Text('Network Status'),
//                 trailing: Text(
//                   networkConnected ? 'Connected' : 'Disconnected',
//                   style: TextStyle(color: networkConnected ? Colors.green : Colors.red),
//                 ),
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 leading: const Icon(Icons.confirmation_number),
//                 title: const Text('Total DTIDs Issued'),
//                 trailing: Text('$totalDtids'),
//               ),
//               ListTile(
//                 contentPadding: EdgeInsets.zero,
//                 leading: const Icon(Icons.data_usage),
//                 title: const Text('Last Block'),
//                 trailing: Text('#$lastBlock'),
//               ),

//               const SizedBox(height: 32),
              
//               // Save Button
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: ElevatedButton.icon(
//                   icon: const Icon(Icons.save),
//                   label: const Text('Save Settings'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                   ),
//                   onPressed: () {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Settings saved!')),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }