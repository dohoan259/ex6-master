import 'dart:math';

import 'package:ex6/data/product.dart';

class CartItem {
  final int _id;
  final Product product;
  int quantity = 1;

  double get totalPrice => product.price * quantity;

  int get id => _id;

  CartItem({required this.product}) : _id = Random().nextInt(100);
}
