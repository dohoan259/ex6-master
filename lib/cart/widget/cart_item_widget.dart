import 'package:ex6/data/cart_item.dart';
import 'package:flutter/material.dart';

import '../cart_state.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;
  final Function() refresh;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
    required this.refresh,
  }) : super(key: key);

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    var cartItem = widget.cartItem;
    var product = cartItem.product;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              child: Image.network(
                product.img,
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartState.removeCartItem(cartItem);
                          setState(() {});
                          widget.refresh();
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Price:',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: '\$${product.price}',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Sub Total:',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                      children: [
                        TextSpan(
                          text: '\$${cartItem.totalPrice}',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Ships Free',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.orangeAccent,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () async {
                          if (cartItem.quantity > 0) {
                            cartState.changeProductNumber(cartItem.id, -1);
                            setState(() {});
                            widget.refresh();
                          }
                        },
                        icon: const Icon(Icons.remove, color: Colors.red),
                      ),
                      Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${cartItem.quantity}',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          cartState.changeProductNumber(cartItem.id, 1);
                          setState(() {});
                          widget.refresh();
                        },
                        icon: const Icon(Icons.add, color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
