import 'package:asos_clone/screens/list-page/list-page.dart';
import 'package:asos_clone/screens/login/login-screen.dart';
import 'package:asos_clone/screens/product-details/product-details-screen.dart';
import 'package:asos_clone/screens/product-info/product-info-screen.dart';
import 'package:asos_clone/screens/wishlist/wishlist-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Asos clone app',
    initialRoute: '/login',
    // onGenerateRoute: (settings) {},
    routes: {
      '/product-list': (context) => ListPage(),
      '/product-details': (context) => ProductDetailsScreen(),
      '/product-info': (context) => ProductInfoScreen(),
      '/login': (context) => LoginScreen(),
      '/wishlist': (context) => WishlistScreen(),
    },
  ));
}
