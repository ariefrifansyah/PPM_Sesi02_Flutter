import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../../widgets/profile_card.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Akun Saya', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ProfileCard(),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: appPaleBlue.withOpacity(0.5))),
            child: Column(
              children: [
                ListTile(leading: const Icon(Icons.settings, color: appPrimaryBlue), title: const Text('Pengaturan Akun'), trailing: const Icon(Icons.chevron_right, color: appLightBlue), onTap: () {}),
                Divider(height: 1, color: appPaleBlue.withOpacity(0.5)),
                ListTile(leading: const Icon(Icons.location_on, color: appPrimaryBlue), title: const Text('Alamat Pengiriman'), trailing: const Icon(Icons.chevron_right, color: appLightBlue), onTap: () {}),
                Divider(height: 1, color: appPaleBlue.withOpacity(0.5)),
                ListTile(leading: const Icon(Icons.help_outline, color: appPrimaryBlue), title: const Text('Pusat Bantuan'), trailing: const Icon(Icons.chevron_right, color: appLightBlue), onTap: () {}),
              ],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.redAccent, elevation: 0, side: const BorderSide(color: Colors.redAccent)), 
            onPressed: () {}, 
            child: const Text('Keluar (Logout)', style: TextStyle(fontWeight: FontWeight.bold))
          ),
        ],
      ),
    );
  }
}