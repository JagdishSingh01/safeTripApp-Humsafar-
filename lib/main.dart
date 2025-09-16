import 'package:flutter/material.dart';
import 'presentation/screens/tourist_signin_screen.dart';
import 'presentation/screens/police_signin_screen.dart';
import 'presentation/screens/tourism_dept_signin_screen.dart';
import 'presentation/screens/admin_signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Tourist Safety System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum Role { tourist, police, tourism, admin }

class _HomePageState extends State<HomePage> {
  Role? _selectedRole;

  Widget _roleCard({
    required IconData icon,
    required String title,
    required String description,
    required Role role,
    required Color highlightColor,
    required VoidCallback onTap,
  }) {
    final bool isSelected = _selectedRole == role;
    Color iconColor = isSelected ? highlightColor : Colors.black45;
    Color titleColor = isSelected ? highlightColor : Colors.black87;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedRole = role;
          });
          Future.delayed(const Duration(milliseconds: 150), onTap);
        },
        borderRadius: BorderRadius.circular(16),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: Row(
              children: [
                Icon(icon, size: 32, color: iconColor),
                const SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 18.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(18),
                  child: const Icon(Icons.shield, size: 48, color: Colors.blue),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Smart Tourist Safety System',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enhancing tourist safety in North Eastern India through AI, blockchain, and real-time monitoring',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black54),
                ),
                const SizedBox(height: 28),
                const Text(
                  'Select Your Role',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 12),
                _roleCard(
                  icon: Icons.person_outline,
                  title: 'Tourist',
                  description:
                      'Access your Digital Tourist ID and safety features',
                  role: Role.tourist,
                  highlightColor: Colors.blue,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TouristSignInScreen(),
                      ),
                    );
                  },
                ),
                _roleCard(
                  icon: Icons.shield_outlined,
                  title: 'Police Officer',
                  description: 'Monitor incidents and manage tourist safety',
                  role: Role.police,
                  highlightColor: Colors.red,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PoliceSignInScreen(),
                      ),
                    );
                  },
                ),
                _roleCard(
                  icon: Icons.analytics_outlined,
                  title: 'Tourism Department',
                  description: 'Oversee tourist analytics and geo-fencing',
                  role: Role.tourism,
                  highlightColor: Colors.green,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TourismDeptSignInScreen(),
                      ),
                    );
                  },
                ),
                _roleCard(
                  icon: Icons.settings_outlined,
                  title: 'System Admin',
                  description: 'Full system access and configuration',
                  role: Role.admin,
                  highlightColor: Colors.purple,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminSignInScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
