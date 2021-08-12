import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String? id;
  final String? title;
  final double? price;
  final int? quantitiy;

  const CartItem({
    this.id,
    this.title,
    this.price,
    this.quantitiy,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15.0  ,vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: FittedBox(child: Text('\$ $price')),
          )),
          title: Text(title!),
          subtitle: Text('Total: \$ ${(price! * quantitiy!)}'),
          trailing: Text('$quantitiy x '),
        ),
      ),
    );
  }
}
