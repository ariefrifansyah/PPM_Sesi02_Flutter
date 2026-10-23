import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../models/cart_item.dart';
import '../../data/dummy_data.dart';
import '../constants/color.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;
  late int likeCount;
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    likeCount = widget.product.initialLikes;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      isFavorite ? likeCount++ : likeCount--;
    });
  }

  void addToCart() {
    final currentCart = List<CartItem>.from(cartNotifier.value);
    int index = currentCart.indexWhere((item) => item.id == widget.product.id);

    if (index >= 0) {
      currentCart[index].quantity += quantity;
    } else {
      currentCart.add(CartItem(
        id: widget.product.id,
        name: widget.product.name,
        price: widget.product.price,
        imageUrl: widget.product.imageUrl,
        quantity: quantity,
      ));
    }
    cartNotifier.value = currentCart;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Berhasil menambah $quantity ${widget.product.name}', style: const TextStyle(color: Colors.white)),
        action: SnackBarAction(
          label: 'LIHAT KERANJANG',
          textColor: appPaleBlue,
          onPressed: () => selectedTabNotifier.value = 1,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: appDarkNavy,
      ),
    );
    setState(() { quantity = 1; });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.product.price * quantity;
    return Card(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              widget.product.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200, color: Colors.grey.shade200,
                child: const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: appDarkNavy)),
                const SizedBox(height: 4),
                Text(widget.product.category, style: TextStyle(color: appLightBlue, fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: isFavorite ? Colors.red : Colors.grey),
                          onPressed: toggleFavorite,
                        ),
                        const SizedBox(width: 4),
                        Text('${(likeCount / 1000).toStringAsFixed(1)}RB', style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade700)),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: appPaleBlue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, size: 18), 
                            color: appPrimaryBlue, 
                            onPressed: () => setState(() { if (quantity > 1) quantity--; })
                          ),
                          Text('$quantity', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: appDarkNavy)),
                          IconButton(
                            icon: const Icon(Icons.add, size: 18), 
                            color: appPrimaryBlue, 
                            onPressed: () => setState(() { quantity++; })
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(height: 24, color: appPaleBlue),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:', style: TextStyle(fontSize: 14, color: Colors.black54)),
                    Text(
                      'Rp ${(totalPrice).toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: appPrimaryBlue),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: appPrimaryBlue, 
                      foregroundColor: Colors.white, 
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    onPressed: addToCart,
                    child: const Text('Tambah ke Keranjang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}