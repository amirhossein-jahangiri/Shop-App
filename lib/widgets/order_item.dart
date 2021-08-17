import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/order_item.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem orders;

  const OrderItem(this.orders);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${orders.amount}'),
            subtitle: Text(DateFormat('dd mm yyyy').format(orders.dateTime!)),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.expand_more)),
          )
        ],
      ),
    );
  }
}
