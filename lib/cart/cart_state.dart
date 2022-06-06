import 'package:ex6/data/cart_item.dart';
import 'package:ex6/data/product.dart';

class CartState {
  final _cartList = <CartItem>[];

  List<CartItem> get cartItemList => _cartList;

  double get totalPrice {
    double total = 0;
    for (CartItem cart in _cartList) {
      total += cart.totalPrice;
    }
    return total;
  }

  void addToCart(Product p, [int number = 1]) {
    var productExisted = false;
    for (CartItem cartItem in _cartList) {
      if (cartItem.product.id == p.id) {
        cartItem.quantity += number;
        productExisted = true;
        break;
      }
    }
    if (!productExisted) {
      _cartList.add(CartItem(product: p));
    }
  }

  void changeProductNumber(int cartId, int productNumber) {
    for (CartItem cartItem in _cartList) {
      if (cartItem.id == cartId) {
        cartItem.quantity += productNumber;
        break;
      }
    }
  }

  void removeCartItem(CartItem cartItem) {
    _cartList.removeWhere((element) => element.id == cartItem.id);
  }
}

final cartState = CartState();
