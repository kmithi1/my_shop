import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../screens/product_detail_screen.dart';

class ProductGridItem extends StatelessWidget {
  final Function favTapped;
  ProductGridItem(this.favTapped);

  void didPressFavorite(Product product) {
    product.toggleIsFavorite();
    favTapped();
  }

  void didPressAddToCart(Cart cart, Product product, BuildContext ctx) {
    cart.addItem(product.id, product.price, product.title, product);
    Scaffold.of(ctx).hideCurrentSnackBar();
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text("Item added to card"),
        duration: Duration(
          seconds: 2,
        ),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            cart.removeItem(product.id);
          },
        ),
      ),
    );
  }

  void didTapGridItem(BuildContext context, Product product) {
    Navigator.of(context).pushNamed(
      ProductDetailScreen.routeName,
      arguments: product.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    Product product = Provider.of<Product>(context, listen: false);
    Cart cart = Provider.of<Cart>(context, listen: false);

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
          onPressed: () {
            didPressAddToCart(cart, product, context);
          },
          color: Theme.of(context).buttonColor,
        ),
      ),
    );
  }
}
