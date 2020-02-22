import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_provider.dart';

import './cart_item_action_row.dart';
import './product_row.dart';

class CartRow extends StatelessWidget {
  final CartItem item;

  CartRow(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.only(
        bottom: 16,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ProductRow(
              item.title,
              item.product.imageUrl,
              item.price,
            ),
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.black12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: CartItemActionRow(
              item.product.id,
              item.quantity,
            ),
          ),
        ],
      ),
    );
  }
}
