// lib/presentation/widgets/role_card.dart

import 'package:flutter/material.dart';

// This widget has a single responsibility: to display a role card.
class RoleCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isSelected;
  final Color highlightColor;
  final VoidCallback onTap;

  const RoleCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.highlightColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color iconColor = isSelected ? highlightColor : Colors.black45;
    Color titleColor = isSelected ? highlightColor : Colors.black87;

    return InkWell(
      onTap: onTap,
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
    );
  }
}