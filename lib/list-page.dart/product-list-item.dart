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
          Image(image: NetworkImage(product.imageUrl)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.product.price,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(
                  this.product.isFavorited
                      ? Icons.favorite_border
                      : Icons.favorite,
                  color: Colors.white,
                ),
                onPressed: () => debugPrint('item favorited'),
              )
            ],
          ),
          Text(
            this.product.name,
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
      {this.id, this.name, this.price, this.imageUrl, this.isFavorited});
}
