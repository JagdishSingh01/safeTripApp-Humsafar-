import 'package:flutter/material.dart';

class _EmergencyResponseCard extends StatefulWidget {
  @override
  State<_EmergencyResponseCard> createState() => _EmergencyResponseCardState();
}

class _EmergencyResponseCardState extends State<_EmergencyResponseCard> {
  bool _alertSent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      color: _alertSent ? Colors.red.shade50 : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.warning_amber_rounded, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  'Emergency Response',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child:
                  _alertSent
                      ? Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.emergency, color: Colors.red, size: 22),
                            SizedBox(width: 8),
                            Text(
                              'ALERT SENT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      )
                      : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          setState(() {
                            _alertSent = true;
                          });
                        },
                        child: const Text(
                          'PANIC BUTTON',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
            ),
            const SizedBox(height: 8),
            _alertSent
                ? const Text(
                  'Emergency services notified!',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
                : const Text(
                  'Press for immediate help',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
            const SizedBox(height: 10),
            const Text(
              'Emergency Contacts',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 1,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'John Johnson',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Spouse',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.call, color: Colors.blue, size: 18),
                        SizedBox(width: 4),
                        Text('Call', style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
