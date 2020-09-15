import 'dart:developer';

import 'package:asos_clone/models/Product.dart';
import 'package:flutter/material.dart';
import 'product-list-item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList({this.products});

  @override
  Widget build(BuildContext context) {
    log(this.products.toString());
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 2,
        childAspectRatio: (5 / 9),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: this
            .products
            .map(
              (productItem) => ProductListItem(product: productItem),
            )
            .toList(),
      ),
    );
  }
}
