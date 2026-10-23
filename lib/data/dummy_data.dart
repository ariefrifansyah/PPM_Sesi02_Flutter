import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../models/cart_item.dart';

final ValueNotifier<List<CartItem>> cartNotifier = ValueNotifier([]);
final ValueNotifier<int> selectedTabNotifier = ValueNotifier(0);

final List<Product> dummyProducts = [
  Product(
    id: 'prod_earphone',
    name: 'GK KUNTEN Ultra Wide Frequency In Ear Monitor',
    category: 'Audio / Earphone',
    price: 188000,
    imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=600&auto=format&fit=crop',
    initialLikes: 6700,
  ),
  Product(
    id: 'prod_macbook',
    name: 'Apple MacBook Air M1 (2020) 256GB Space Gray',
    category: 'Komputer / Laptop',
    price: 13500000,
    imageUrl: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?q=80&w=600&auto=format&fit=crop',
    initialLikes: 14200,
  ),
  Product(
    id: 'prod_keyboard',
    name: 'VortexSeries VX7 Pro Mechanical Keyboard',
    category: 'Aksesoris / Keyboard',
    price: 450000,
    imageUrl: 'https://images.unsplash.com/photo-1595225476474-87563907a212?q=80&w=600&auto=format&fit=crop',
    initialLikes: 4100,
  ),
];