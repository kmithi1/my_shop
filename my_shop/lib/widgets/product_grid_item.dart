import 'package:flutter/material.dart';
import 'package:my_shop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class ProductGridItem extends StatelessWidget {
  Function favTapped;
  ProductGridItem(this.favTapped);

  void didPressFavorite(Product product) {
    product.toggleIsFavorite();
    favTapped();
  }

  void didPressAddToCart() {}

  void didTapGridItem(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: product.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context, listen: false);
    return GridTile(
      child: GestureDetector(
        onTap: () {
          didTapGridItem(context, product);
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
                Consumer<Product>(
                  builder: (ctx, product, _) {
                    return IconButton(
                      color: (product.isFavorite ? Colors.red : Colors.black38),
                      icon: Icon(product.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        didPressFavorite(product);
                      },
                      alignment: Alignment.topRight,
                    );
                  },
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
