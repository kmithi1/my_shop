import 'package:flutter/material.dart';
import 'package:my_shop/screens/product_detail_screen.dart';

import '../models/product.dart';

class ProductGridItem extends StatelessWidget {
  final Product product;
  ProductGridItem(this.product);

  void didPressFavorite() {}
  void didPressAddToCart() {}

  void didTapGridItem(BuildContext context) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: product.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          didTapGridItem(context);
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  color: Colors.black38,
                  icon: Icon(Icons.favorite_border),
                  onPressed: didPressFavorite,
                  alignment: Alignment.topRight,
                ),
              ],
            ),
          ],
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          product.title,
          textAlign: TextAlign.start,
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: didPressAddToCart,
          color: Theme.of(context).buttonColor,
        ),
      ),
    );
  }
}
