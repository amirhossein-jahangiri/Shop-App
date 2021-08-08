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
    final loadedProduct = Provider.of<Products>(context , listen: false);
    final product = loadedProduct.findById(productId);
    return Scaffold(
      appBar: AppBar(title: Text(product.title!)),
    );
  }
}
