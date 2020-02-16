import 'package:flutter/material.dart';
import 'package:my_shop/providers/product_provider.dart';
import 'package:my_shop/providers/products_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid_item.dart';

class HomeScreen extends StatefulWidget {
  final bool showOnlyFavorites;

  HomeScreen({this.showOnlyFavorites = false});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Products productsProvider = Provider.of<Products>(context);
    final List<Product> products = widget.showOnlyFavorites
        ? productsProvider.favoritesProducts
        : productsProvider.items;

    return GridView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
//          create: (c) => products[index],
          value: products[index],
          child: ProductGridItem(() {
            if (widget.showOnlyFavorites) {
              this.setState(() {});
            }
          }),
        );
      },
    );
  }
}
