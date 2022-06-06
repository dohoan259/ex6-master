import 'package:ex6/cart/cart_state.dart';
import 'package:flutter/material.dart';

import 'cart_item_widget.dart';

class CartListScreen extends StatelessWidget {
  const CartListScreen({Key? key, required this.onRefreshed}) : super(key: key);

  final VoidCallback onRefreshed;

  @override
  Widget build(BuildContext context) {
    final cartItemList = cartState.cartItemList;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: cartItemList.length,
      itemBuilder: (context, index) {
        var cart = cartItemList[index];
        return CartItemWidget(
          cartItem: cart,
          refresh: onRefreshed,
        );
      },
    );
  }
}
