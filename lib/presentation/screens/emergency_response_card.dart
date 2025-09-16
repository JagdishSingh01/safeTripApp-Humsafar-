import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safe_trip/presentation/bloc/emergency_bloc/emergency_bloc.dart';

class EmergencyResponseCard extends StatelessWidget {
  const EmergencyResponseCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.warning_amber_rounded, color: Colors.red),
                SizedBox(width: 8),
                Text('Emergency Response', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            // Use BlocBuilder to rebuild only the button based on state changes.
            BlocBuilder<EmergencyBloc, EmergencyState>(
              builder: (context, state) {
                if (state.status == EmergencyStatus.sent) {
                  return buildAlertSentButton();
                } else {
                  return buildPanicButton(context, state.status);
                }
              },
            ),
            const SizedBox(height: 8),
            const Text('Press for immediate help', style: TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 10),
            const Text('Emergency Contacts', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('John Johnson'),
                Text('Call', style: TextStyle(color: Colors.blue)),
              ],
            ),
            const Text('Spouse', style: TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget buildPanicButton(BuildContext context, EmergencyStatus status) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: status == EmergencyStatus.sending ? null : () {
          // Add the event to the BLoC on button press.
          BlocProvider.of<EmergencyBloc>(context).add(PanicButtonPressed());
        },
        icon: const Icon(Icons.error_outline),
        label: Text(
          status == EmergencyStatus.sending ? 'Sending...' : 'PANIC BUTTON',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  Widget buildAlertSentButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: null,
        icon: const Icon(Icons.notifications_active),
        label: const Text(
          'ALERT SENT',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}