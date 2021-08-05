import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  final String? id;
  const ProductDetailScreen({this.id});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context , listen: true).findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.title!)),
      body: Center(
        child: Text(loadedProduct.description!, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
      ),
    );
  }
}
