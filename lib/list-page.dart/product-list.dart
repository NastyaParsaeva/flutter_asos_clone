import 'package:flutter/material.dart';

import 'product-list-item.dart';

final mockProducts = ProductListItemType(
  id: 24,
  name: 'Атласное платье макси с цветочным принтом ASOS EDITION',
  price: '8 090,00 руб.',
  imageUrl:
      '//images.asos-media.com/products/atlasnoe-plate-maksi-s-tsvetochnym-printom-asos-edition/14563661-1-multi',
  isFavorited: false,
);

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
        children: List.generate(this.products.length, (index) {
          return ProductListItem(
              product: new ProductListItemType(
            id: 24,
            name: 'Атласное платье макси с цветочным принтом ASOS EDITION',
            price: '8 090,00 руб.',
            imageUrl:
                '//images.asos-media.com/products/atlasnoe-plate-maksi-s-tsvetochnym-printom-asos-edition/14563661-1-multi',
            isFavorited: false,
          ));
        }),
      ),
    );
  }
}
