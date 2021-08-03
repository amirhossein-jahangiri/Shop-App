import 'package:flutter/material.dart';


class ProductDetailScreen extends StatelessWidget {
  static const String routeName = '/product-detail';

  final String? title;
  const ProductDetailScreen({this.title});

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.name as String;
    return Scaffold(
      appBar: AppBar(title: Text('title')),
    );
  }
}
