import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  bool showFavs;
  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: false);
    final productsList = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
      ),
      itemCount: productsList.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: productsList[index],
        child: ProductItem(),
      ),
    );
  }
}