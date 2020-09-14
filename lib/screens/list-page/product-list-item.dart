import 'dart:ui';
import 'package:asos_clone/consts/MyColors.dart';
import 'package:asos_clone/screens/product-details/product-details-screen.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final ProductListItemType product;
  ProductListItem({this.product});

  @override
  Widget build(BuildContext context) {
    debugPrint(this.product.toString());
    return GestureDetector(
      onTap: () => {
        debugPrint('item "${this.product.id}" clicked'),
        Navigator.pushNamed(
          context,
          '/product-details',
          arguments: this.product,
        ),
      },
      child: Card(
        color: MyColors.cartItemBlack,
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
                  onPressed: () =>
                      debugPrint("item '${this.product.id}' favorited"),
                )
              ],
            ),
            Text(
              this.product.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
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
  String color;
  List<String> sizeList;
  String productDetails;

  ProductListItemType(
      {this.id,
      this.name,
      this.price,
      this.imageUrl,
      this.isFavorited,
      this.color,
      this.sizeList,
      this.productDetails});
}
