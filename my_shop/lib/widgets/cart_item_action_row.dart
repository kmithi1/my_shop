import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import 'number_stepper.dart';

class CartItemActionRow extends StatelessWidget {
  final String id;
  final int quantity;
  CartItemActionRow(
    this.id,
    this.quantity,
  );

  void _didChangeQuantity(int newQuantity, Cart cart) {
    cart.updateQuantity(id, newQuantity);
  }

  void _deleteItem(Cart cart) {
    cart.removeItem(id);
  }

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);

    return Column(
      children: <Widget>[
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: NumberStepper(
                  minValue: 1,
                  maxValue: 5,
                  currentValue: quantity,
                  onChange: (newVal) {
                    _didChangeQuantity(newVal, cart);
                  },
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {
                    _deleteItem(cart);
                  },
                  child: Text(
                    "Remove Item",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
