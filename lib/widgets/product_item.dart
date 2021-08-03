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
    return GridTile(
      child: Image.network(imageUrl!, fit: BoxFit.cover),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(title!, textAlign: TextAlign.center),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border_outlined),
          iconSize: 20,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart_outlined),
          iconSize: 20,
        ),
      ),
    );
  }
}
