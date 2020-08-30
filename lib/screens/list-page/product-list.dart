import 'package:flutter/material.dart';
import 'product-list-item.dart';

class ProductList extends StatelessWidget {
  final List<ProductListItemType> products;

  ProductList({this.products});

  @override
  Widget build(BuildContext context) {
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
