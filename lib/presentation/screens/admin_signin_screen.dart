// import 'package:flutter/material.dart';
// import 'package:safe_trip/presentation/screens/admin/admin_dashboard_screen.dart';


// class AdminSignInScreen extends StatefulWidget {
//   const AdminSignInScreen({Key? key}) : super(key: key);

//   @override
//   State<AdminSignInScreen> createState() => _AdminSignInScreenState();
// }

// class _AdminSignInScreenState extends State<AdminSignInScreen> {
//   final TextEditingController _emailController = TextEditingController(
//     text: 'admin@demo.com',
//   );
//   final TextEditingController _passwordController = TextEditingController(
//     text: 'demo123',
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF7FAFF),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(18.0),
//             child: Card(
//               elevation: 8,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 24,
//                   vertical: 32,
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.purple.shade50,
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 18,
//                         vertical: 8,
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           const Icon(
//                             Icons.settings_outlined,
//                             color: Colors.purple,
//                             size: 24,
//                           ),
//                           const SizedBox(width: 8),
//                           const Text(
//                             'System Admin Login',
//                             style: TextStyle(
//                               color: Colors.purple,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 22),
//                     const Text(
//                       'Sign In to Continue',
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//                     TextField(
//                       controller: _emailController,
//                       decoration: InputDecoration(
//                         labelText: 'Email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                       enabled: false,
//                     ),
//                     const SizedBox(height: 16),
//                     TextField(
//                       controller: _passwordController,
//                       decoration: InputDecoration(
//                         labelText: 'Password',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                       obscureText: true,
//                     ),
//                     const SizedBox(height: 24),
//                     SizedBox(
//                       width: double.infinity,
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFF1976D2), Color(0xFF26C281)],
//                             begin: Alignment.centerLeft,
//                             end: Alignment.centerRight,
//                           ),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                             shadowColor: Colors.transparent,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                           ),
//                           onPressed: () {
//                             // TODO: Add sign-in logic
//                             Navigator.pushReplacement(
//                               context,
//                               MaterialPageRoute(
//                                 builder:
//                                     (context) => AdminDashboardScreen(),
//                               ),
//                             );
//                           },
//                           child: const Text(
//                             'Sign In',
//                             style: TextStyle(fontSize: 18, color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 18),
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(14),
//                       decoration: BoxDecoration(
//                         color: Colors.blue.shade50,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Demo Credentials:',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 4),
//                           Text('Email: Auto-filled based on role'),
//                           Text('Password: demo123'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
