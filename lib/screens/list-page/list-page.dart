import 'dart:developer';

import 'package:asos_clone/common/my-app-bar.dart';
import 'package:asos_clone/consts/MyColors.dart';
import 'package:asos_clone/models/Product.dart';
import 'package:asos_clone/screens/list-page/product-list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<Product>> fetchProductList() async {
  final http.Response response =
      await http.Client().get('http://192.168.1.69:8000/product-list');

  if (response.statusCode == 200) {
    Iterable decodedBody = json.decode(response.body);
    List<Product> productList =
        (decodedBody as List).map((e) => Product.fromJson(e)).toList();
    return productList;
  } else {
    throw Exception('Failed to get products');
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future<List<Product>> futureProductList;

  @override
  void initState() {
    super.initState();
    futureProductList = fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: 'Новинки: одежда',
        leading: IconButton(
            icon: Icon(Icons.menu), onPressed: () => {log('menu click')}),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => {log('open wishlist')},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {log('search')},
          ),
        ],
      ),
      body: FutureBuilder(
          future: futureProductList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ProductList(
                products: snapshot.data,
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
      backgroundColor: MyColors.black,
    );
  }
}
