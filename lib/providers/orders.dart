import 'package:flutter/foundation.dart';

import '../models/order_item.dart';
import '../models/cart_item.dart' as ci;

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders => [..._orders];


  void addOrder(List<ci.CartItem> cartProducts, double total) {
    _orders.insert(0, OrderItem(
      id: DateTime.now().toString(),
      amount: total,
      dateTime: DateTime.now(),
      products: cartProducts,
    ));
    notifyListeners();
  }
}





