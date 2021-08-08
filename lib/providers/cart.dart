import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};

  Map<String, CartItem> get items => {..._items!};

  int get itemCount {
    return _items!.length;
  }

  void addItem(String productId, String title, double price) {
    if (_items!.containsKey(productId)) {
      _items!.update(
        productId,
        (existingItem) => CartItem(
          id: existingItem.id,
          title: existingItem.title,
          price: existingItem.price,
          quantity: existingItem.quantity! + 1,
        ),
      );
    } else {
      _items!.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }
}
