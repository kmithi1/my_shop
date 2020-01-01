import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  ProductGridItem(this.product);

  void didPressFavorite() {}
  void didPressAddToCart() {}

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Image.network(
        product.imageUrl,
        fit: BoxFit.cover,
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black26,
        title: Text(
          product.title,
          textAlign: TextAlign.start,
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: didPressAddToCart,
        ),
      ),
      header: GridTileBar(
        title: Text(''),
        trailing: IconButton(
          color: Colors.black38,
          icon: Icon(Icons.favorite_border),
          onPressed: didPressFavorite,
          alignment: Alignment.topRight,
        ),
      ),
    );
  }
}
