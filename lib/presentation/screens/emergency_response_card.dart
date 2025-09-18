// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';
// import 'package:safe_trip/presentation/bloc/emergency_bloc/emergency_bloc.dart';
// import '../../providers/incident_provider.dart';
// import 'dart:math';

// class EmergencyResponseCard extends StatelessWidget {
//   const EmergencyResponseCard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       elevation: 2,
//       child: Padding(
//         padding: const EdgeInsets.all(18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: const [
//                 Icon(Icons.warning_amber_rounded, color: Colors.red),
//                 SizedBox(width: 8),
//                 Text(
//                   'Emergency Response',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 12),
//             // Use BlocBuilder to rebuild only the button based on state changes.
//             BlocBuilder<EmergencyBloc, EmergencyState>(
//               builder: (context, state) {
//                 if (state.status == EmergencyStatus.sent) {
//                   return const _AlertSentButton();
//                 } else {
//                   return const _PanicButton();
//                 }
//               },
//             ),
//             const SizedBox(height: 8),
//             const Text(
//               'Press for immediate help',
//               style: TextStyle(fontSize: 12, color: Colors.black54),
//             ),
//             const SizedBox(height: 10),
//             const Text(
//               'Emergency Contacts',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 6),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text('John Johnson'),
//                 Text('Call', style: TextStyle(color: Colors.blue)),
//               ],
//             ),
//             const Text(
//               'Spouse',
//               style: TextStyle(fontSize: 12, color: Colors.black54),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // Private helper widget for the panic button.
// class _PanicButton extends StatelessWidget {
//   const _PanicButton({Key? key}) : super(key: key);

//   String _generateIncidentId() {
//     // Use timestamp + random for uniqueness
//     final now = DateTime.now().millisecondsSinceEpoch;
//     final rand = Random().nextInt(100000);
//     return 'INC-$now-$rand';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final status = context.watch<EmergencyBloc>().state.status;
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.red,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           padding: const EdgeInsets.symmetric(vertical: 14),
//         ),
//         onPressed:
//             status == EmergencyStatus.sending
//                 ? null
//                 : () {
//                   BlocProvider.of<EmergencyBloc>(
//                     context,
//                   ).add(PanicButtonPressed());
//                   // Add critical incident to provider
//                   Provider.of<IncidentProvider>(
//                     context,
//                     listen: false,
//                   ).addCriticalIncident(
//                     Incident(
//                       incidentId: _generateIncidentId(),
//                       touristName: 'Sarah Johnson',
//                       digitalId: 'DTID-2024-NE-001',
//                       incidentType: 'Panic',
//                       severity: 'CRITICAL',
//                       description: 'Emergency panic button activated',
//                       location: '18.604775, 73.875440',
//                       created: DateTime.now().toString(),
//                       updated: DateTime.now().toString(),
//                       assignedOfficer: null,
//                       status: 'open',
//                     ),
//                   );
//                 },
//         icon: const Icon(
//           Icons.warning_amber_rounded,
//           color: Colors.white,
//           size: 22,
//         ),
//         label: const Text(
//           'PANIC BUTTON',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Private helper widget for the alert sent button.
// class _AlertSentButton extends StatelessWidget {
//   const _AlertSentButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton.icon(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.grey,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//           padding: const EdgeInsets.symmetric(vertical: 14),
//         ),
//         onPressed: null,
//         icon: const Icon(Icons.notifications_active),
//         label: const Text(
//           'ALERT SENT',
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//       ),
//     );
//   }
// }