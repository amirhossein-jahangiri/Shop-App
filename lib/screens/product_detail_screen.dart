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

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              child: Image.network(product.imageUrl! ,fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Text(
              '\$${product.price}',style: TextStyle(fontSize: 20.0 , color: Colors.grey),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: Text(
                product.description!,
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}















