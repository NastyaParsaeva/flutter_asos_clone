import 'dart:ui';

import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final ProductListItemType product;
  ProductListItem({this.product});

  @override
  Widget build(BuildContext context) {
    debugPrint(this.product.toString());
    return Card(
      color: Color(0xff111111),
      shadowColor: Colors.transparent,
      child: Column(
        children: [
          Image(
              image: NetworkImage(
                  '//images.asos-media.com/products/atlasnoe-plate-maksi-s-tsvetochnym-printom-asos-edition/14563661-1-multi')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // this.product.price,
                '5555 руб.',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  // this.product.isFavorited
                  //     ? Icons.favorite_border
                  //     : Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () => debugPrint('item favorited'),
              )
            ],
          ),
          Text(
            // this.product.name,
            'stupid name',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductListItemType {
  int id;
  String name;
  String price;
  String imageUrl;
  bool isFavorited;

  ProductListItemType(
      {int id, String name, String price, String imageUrl, bool isFavorited});
}
