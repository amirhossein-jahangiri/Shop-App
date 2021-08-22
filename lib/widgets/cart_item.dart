import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String? productId;
  final String? id;
  final String? title;
  final double? price;
  final int? quantitiy;

  const CartItem({
    this.productId,
    this.id,
    this.title,
    this.price,
    this.quantitiy,
  });

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<Cart>(context , listen: false);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to remove the item from the cart?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text('Yes'),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        log('product id is ${productId!}');
        Provider.of<Cart>(context, listen: false).removeItem(productId!);
      },
      background: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 4.0,
        ),
        padding: const EdgeInsets.only(right: 20.0),
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
                child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(child: Text('\$ $price')),
            )),
            title: Text(title!),
            subtitle: Text('Total: \$ ${(price! * quantitiy!)}'),
            trailing: Text('$quantitiy x '),
          ),
        ),
      ),
    );
  }
}
