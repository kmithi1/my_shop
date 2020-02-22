import 'package:flutter/material.dart';

class ProductRow extends StatelessWidget {
  final String productName;
  final String imageUrl;
  final double price;

  ProductRow(
    this.productName,
    this.imageUrl,
    this.price,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Price: \$${price.toStringAsFixed(2)} per unit",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black45),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            width: 54,
            height: 54,
            child: Image.network(imageUrl),
          ),
        ],
      ),
    );
  }
}
