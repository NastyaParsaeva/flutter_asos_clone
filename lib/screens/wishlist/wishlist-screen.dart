import 'package:asos_clone/common/my-app-bar.dart';
import 'package:asos_clone/common/my-app-scafold.dart';
import 'package:asos_clone/screens/wishlist/whishlist-screen-item.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MyAppScafold(
      // key: _scaffoldKey,
      appBar: MyAppBar(
        titleText: 'Избранное',
        isWithBackButton: true,
      ),
      body: Column(
        children: [
          WishlistItem(),
        ],
      ),
    );
  }
}
