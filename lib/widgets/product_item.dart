import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String? id;
  final String? title;
  final String? imageUrl;

  const ProductItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: Image.network(imageUrl!, fit: BoxFit.cover),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(title!, textAlign: TextAlign.center),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
            iconSize: 20,
            color: Theme.of(context).accentColor,
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
            iconSize: 20,
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
