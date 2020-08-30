import 'package:asos_clone/screens/list-page/product-list-item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product';

  // final ProductListItemType product;

  // ProductDetailsScreen({this.product});

  @override
  Widget build(BuildContext context) {
    final ProductListItemType product =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Column(
        children: [
          FittedBox(
            child: Image(
              image: NetworkImage(product.imageUrl),
            ),
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: TextStyle(
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    product.price,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    //TODO: change to Divider
                    border: Border.symmetric(
                        vertical:
                            BorderSide(width: 1, color: Color(0xff525050))),
                  ),
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          product.color,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(product.size.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff000000),
    );
  }
}
