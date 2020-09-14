import 'dart:developer';

import 'package:asos_clone/screens/list-page/product-list-item.dart';
import 'package:asos_clone/screens/product-details/product-details-picture.dart';
import 'package:asos_clone/screens/product-details/product-details-size-picker.dart';
import 'package:asos_clone/screens/product-details/product-details-size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = '/product';

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedSizeIndex = -1;

  @override
  Widget build(BuildContext context) {
    final ProductListItemType product =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailsPicture(
              productImages: [product.imageUrl],
              onBackClick: () => {Navigator.pop(context)},
              onShareClick: () => {log('share product from details')},
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
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
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      product.price,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.5,
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xff525050),
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          product.color.toUpperCase(),
                          style: TextStyle(
                            color: Color(0xff999999),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                          height: 25,
                          child: VerticalDivider(
                            color: Color(0xff525050),
                            width: 20,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                          )),
                      ProductDetailsSize(
                        sizeList: product.sizeList,
                        selectedSizeIndex: _selectedSizeIndex,
                        onSizePress: () => onSizePress(product),
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xff525050),
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 1,
                        child: MaterialButton(
                          onPressed: () => log('add to cart pressed'),
                          color: Color(0xff018849),
                          child: Text(
                            'Добавить в корзину'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        color: Color(0xffeeeeee),
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                        onPressed: () => log('product favoroted'),
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0xff525050),
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                  GestureDetector(
                    onTap: () => log('product Info click'),
                    child: Text(
                      'Информация о товаре'.toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff000000),
      drawerScrimColor: Color(0xff000000),
    );
  }

  void onSizePress(ProductListItemType product) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ProductDetailSizePicker(
        sizeList: product.sizeList,
        onSizeSelect: (int index) => {
          setState(() {
            this._selectedSizeIndex = index;
          }),
          Navigator.pop(context),
        },
      ),
    );
  }
}
