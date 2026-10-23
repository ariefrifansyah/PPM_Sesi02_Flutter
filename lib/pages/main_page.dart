import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../../data/dummy_data.dart';
import '../../models/cart_item.dart';
import 'home_tab.dart';
import 'cart_tab.dart';
import 'transaction_tab.dart';
import 'account_tab.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final List<Widget> _pages = const [
    HomeTab(),
    CartTab(),
    TransactionTab(),
    AccountTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedTabNotifier,
      builder: (context, currentIndex, child) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) => selectedTabNotifier.value = index,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: appPrimaryBlue,
            unselectedItemColor: Colors.grey.shade500,
            elevation: 10,
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
              BottomNavigationBarItem(
                icon: ValueListenableBuilder<List<CartItem>>(
                  valueListenable: cartNotifier,
                  builder: (context, cart, child) {
                    int count = cart.fold(0, (sum, item) => sum + item.quantity);
                    if (count > 0) {
                      return Badge(
                        backgroundColor: appLightBlue,
                        label: Text('$count', style: const TextStyle(color: Colors.white)), 
                        child: const Icon(Icons.shopping_cart)
                      );
                    }
                    return const Icon(Icons.shopping_cart_outlined);
                  },
                ),
                label: 'Keranjang',
              ),
              const BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Transaksi'),
              const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Akun'),
            ],
          ),
        );
      },
    );
  }
}