import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/productDetailScreen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product detail'),
      ),
      body: Container(),
    );
  }
}
