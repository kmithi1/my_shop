import 'package:flutter/foundation.dart';
import 'package:my_shop/providers/product_provider.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final Product product;
  final int order;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
    this.product,
    this.order = 0,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get total {
    double _total = 0;
    _items.forEach((_, item) {
      _total = _total + (item.quantity * item.price);
    });

    return _total;
  }

  void addItem(
    String productId,
    double price,
    String title,
    Product product,
  ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
          product: existingCartItem.product,
          order: existingCartItem.order,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1,
            product: product,
            order: _items.length + 1),
      );
    }
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    _items.update(
      productId,
      (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        quantity: quantity,
        product: existingCartItem.product,
        order: existingCartItem.order,
      ),
    );
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }
}
