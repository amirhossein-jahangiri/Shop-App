import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};

  Map<String, CartItem> get items => {..._items!};

  int get itemCount {
    return _items!.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items!.forEach((key, value) {
      total += value.price! * value.quantity!;
    });
    return total;
  }

  void removeItem(String productId) {
    log('remove item method $productId and items length id ${_items!.length}');
    _items!.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items!.containsKey(productId)) return;
    if (_items![productId]!.quantity! > 1) {
      _items!.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity! - 1,
        ),
      );
    }else{
      _items!.remove(productId);
    }
    notifyListeners();
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

  void clear() {
    _items!.clear();
    notifyListeners();
  }
}
