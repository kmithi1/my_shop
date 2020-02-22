import 'package:flutter/material.dart';
import 'package:my_shop/providers/cart_provider.dart';
import 'package:my_shop/widgets/cart_row.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "/cartScreen";

  Widget _bottomWidget(Cart cart) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Total:",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "\$ ${cart.total.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Spacer(),
              FlatButton(
                child: Text(
                  "Place Order",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.orangeAccent,
                padding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 24,
                ),
                onPressed: () {
                  // TODO: pace the order
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cartList(BuildContext context, Cart cart) {
    final List<CartItem> items = cart.items.values.toList();
    items.sort((a, b) => a.order.compareTo(b.order));

    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemBuilder: (ctx, index) {
              return CartRow(items[index]);
            },
            itemCount: cart.itemCount,
          ),
        ),
        _bottomWidget(cart),
      ],
    );
  }

  Widget _emptyCartPlaceHolder(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.shopping_cart,
            size: 100,
            color: Colors.black45,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            "Sorry, \n There are no items in your cart. \n Continue shopping to add items in your cart!!",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black45,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 48,
          ),
          RaisedButton(
            color: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Continue Shopping",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: cart.itemCount > 0
          ? _cartList(context, cart)
          : _emptyCartPlaceHolder(context),
    );
  }
}
