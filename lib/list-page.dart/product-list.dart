import 'package:flutter/material.dart';
import 'product-list-item.dart';

final List<ProductListItemType> mockProducts = [
  new ProductListItemType(
    id: 24,
    name: '[eqyz Атласное платье макси с цветочным принтом ASOS EDITION',
    price: '8 090,00 руб.',
    imageUrl:
        'http://images.asos-media.com/products/blestyaschee-atlasnoe-plate-kombinatsiya-mini-so-shnurovkoj-na-spine-asos-design/20041579-1-black',
    isFavorited: true,
  ),
  new ProductListItemType(
    id: 28,
    name: 'Not Атласное платье макси с цветочным принтом ASOS EDITION',
    price: 'free',
    imageUrl:
        'http://images.asos-media.com/products/blestyaschee-atlasnoe-plate-kombinatsiya-mini-so-shnurovkoj-na-spine-asos-design/20041579-1-black',
    isFavorited: false,
  ),
  new ProductListItemType(
    id: 28,
    name: 'Not Атласное платье макси с цветочным принтом ASOS EDITION',
    price: 'free',
    imageUrl:
        'http://images.asos-media.com/products/blestyaschee-atlasnoe-plate-kombinatsiya-mini-so-shnurovkoj-na-spine-asos-design/20041579-1-black',
    isFavorited: false,
  )
];

final List<int> mockList = [8, 12, 43, 05, 000, 45, 88];

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
