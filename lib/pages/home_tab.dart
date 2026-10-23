import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../../data/dummy_data.dart';
import '../../widgets/promo_banner.dart';
import '../../widgets/profile_card.dart';
import '../../widgets/product_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = dummyProducts
        .where((p) => p.name.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PPM Sesi 2 - M. Arief Rifansyah',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => setState(() => searchQuery = value),
              decoration: InputDecoration(
                hintText: 'Cari earphone, macbook, keyboard...',
                hintStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: const Icon(Icons.search, color: appPrimaryBlue),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: appPrimaryBlue, width: 2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const PromoBanner(),
            const SizedBox(height: 16),
            const ProfileCard(),
            const SizedBox(height: 20),
            
            Row(
              children: const [
                Icon(Icons.discount, color: appPrimaryBlue),
                SizedBox(width: 8),
                Text('Rekomendasi Produk', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: appDarkNavy)),
              ],
            ),
            const SizedBox(height: 12),

            if (filteredProducts.isEmpty)
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('Produk tidak ditemukan.', style: TextStyle(color: Colors.grey)),
              )
            else
              ...filteredProducts.map((product) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ProductCard(product: product),
                  )),
          ],
        ),
      ),
    );
  }
}