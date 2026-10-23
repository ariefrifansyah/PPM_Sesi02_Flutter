import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../../data/dummy_data.dart';
import '../../models/cart_item.dart';

class CartTab extends StatefulWidget {
  const CartTab({super.key});

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  
  void _increaseQty(int index) {
    final currentCart = List<CartItem>.from(cartNotifier.value);
    currentCart[index].quantity++;
    cartNotifier.value = currentCart;
  }

  void _decreaseQty(int index) {
    final currentCart = List<CartItem>.from(cartNotifier.value);
    if (currentCart[index].quantity > 1) {
      currentCart[index].quantity--;
      cartNotifier.value = currentCart;
    }
  }

  void _removeItem(int index) {
    final currentCart = List<CartItem>.from(cartNotifier.value);
    currentCart.removeAt(index);
    cartNotifier.value = currentCart;
  }

  void _showCheckoutSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Pilih Metode Pembayaran', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: appDarkNavy)),
              const SizedBox(height: 16),
              ListTile(leading: const Icon(Icons.account_balance, color: appPrimaryBlue), title: const Text('SeaBank Virtual Account'), onTap: () => _processPayment('SeaBank')),
              ListTile(leading: const Icon(Icons.local_shipping, color: appPrimaryBlue), title: const Text('Cash on Delivery (COD)'), onTap: () => _processPayment('COD (Bayar di Tempat)')),
              ListTile(leading: const Icon(Icons.account_balance_wallet, color: appPrimaryBlue), title: const Text('ShopeePay / GoPay'), onTap: () => _processPayment('ShopeePay / E-Wallet')),
            ],
          ),
        );
      },
    );
  }

  void _processPayment(String method) {
    Navigator.pop(context);
    cartNotifier.value = [];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Pesanan Berhasil! 🎉', style: TextStyle(color: appDarkNavy, fontWeight: FontWeight.bold)),
        content: Text('Pembayaran sukses menggunakan $method. Silakan cek menu Transaksi.', style: const TextStyle(color: Colors.black87)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              selectedTabNotifier.value = 2;
            },
            child: const Text('Selesai', style: TextStyle(color: appPrimaryBlue, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Keranjang Belanja', style: TextStyle(fontWeight: FontWeight.bold))),
      body: ValueListenableBuilder<List<CartItem>>(
        valueListenable: cartNotifier,
        builder: (context, cartItems, child) {
          if (cartItems.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: appPaleBlue),
                  const SizedBox(height: 16),
                  Text('Keranjangmu masih kosong', style: TextStyle(fontSize: 16, color: appLightBlue, fontWeight: FontWeight.bold)),
                ],
              )
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: appPaleBlue.withOpacity(0.5), blurRadius: 8, offset: const Offset(0, 4))],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              item.imageUrl, 
                              width: 80, 
                              height: 80, 
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => Container(
                                width: 80, height: 80, color: appPaleBlue,
                                child: const Icon(Icons.image_not_supported, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: appDarkNavy)),
                                const SizedBox(height: 4),
                                Text(
                                  'Rp ${item.price.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                                  style: const TextStyle(color: appPrimaryBlue, fontWeight: FontWeight.bold, fontSize: 14),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: appPaleBlue),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () => _decreaseQty(index),
                                            child: const Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), child: Icon(Icons.remove, size: 16, color: appDarkNavy)),
                                          ),
                                          Text('${item.quantity}', style: const TextStyle(fontWeight: FontWeight.bold, color: appPrimaryBlue)),
                                          InkWell(
                                            onTap: () => _increaseQty(index),
                                            child: const Padding(padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4), child: Icon(Icons.add, size: 16, color: appPrimaryBlue)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: const Icon(Icons.delete_outline, color: Colors.redAccent), 
                                      onPressed: () => _removeItem(index)
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: appPaleBlue.withOpacity(0.5), blurRadius: 10, offset: const Offset(0, -5))],
                ),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Total Pembayaran', style: TextStyle(color: Colors.black54, fontSize: 12)),
                          Text(
                            'Rp ${cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity)).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: appPrimaryBlue),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appPrimaryBlue, 
                          foregroundColor: Colors.white, 
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                        ),
                        onPressed: _showCheckoutSheet,
                        child: const Text('Checkout', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}