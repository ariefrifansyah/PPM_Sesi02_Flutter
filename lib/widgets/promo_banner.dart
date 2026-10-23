import 'package:flutter/material.dart';
import '../constants/color.dart';

class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [appDarkNavy, appPrimaryBlue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: appPrimaryBlue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
          ),
          child: const Center(child: Text('Flash Sale Gajian!', style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic, fontWeight: FontWeight.w900, color: Colors.white))),
        ),
        Positioned(
          top: 12, right: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(color: appPaleBlue, borderRadius: BorderRadius.circular(20)),
            child: const Text('Diskon Up To 60%', style: TextStyle(fontWeight: FontWeight.bold, color: appDarkNavy)),
          ),
        ),
      ],
    );
  }
}