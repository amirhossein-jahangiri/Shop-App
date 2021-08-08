import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverViewScreen extends StatefulWidget {
  @override
  _ProductsOverViewScreenState createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  bool _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (selectedItems) {
              setState(() {
                if(selectedItems == FilterOptions.Favorites) {
                  _showFavoritesOnly = true;
                }else{
                  _showFavoritesOnly = false;
                }
              });
            },
            itemBuilder: (context) => <PopupMenuItem>[
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: ProductsGrid(_showFavoritesOnly),
    );
  }
}
