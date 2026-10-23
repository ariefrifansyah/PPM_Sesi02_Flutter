import 'package:flutter/material.dart';
import '../constants/color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2, 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const CircleAvatar(radius: 35, backgroundColor: appPaleBlue, child: Icon(Icons.person, size: 40, color: appDarkNavy)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mohamad Arief Rifansyah', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: appDarkNavy)),
                  const SizedBox(height: 4),
                  Text('NIM: 20240040194', style: TextStyle(color: Colors.grey.shade700)),
                  Text('Teknik Informatika - TI24B', style: TextStyle(color: Colors.grey.shade700)),
                  const SizedBox(height: 8),
                  Row(children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.amber, size: 18))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}