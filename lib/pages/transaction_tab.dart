import 'package:flutter/material.dart';
import '../constants/color.dart';

class TransactionTab extends StatelessWidget {
  const TransactionTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Transaksi', style: TextStyle(fontWeight: FontWeight.bold))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Icon(Icons.receipt_long, size: 80, color: appPaleBlue), 
            const SizedBox(height: 16), 
            Text('Belum ada transaksi bulan ini.', style: TextStyle(color: appLightBlue, fontSize: 16, fontWeight: FontWeight.bold))
          ]
        )
      ),
    );
  }
}