import 'package:asos_clone/common/my-app-drawer.dart';
import 'package:asos_clone/consts/MyColors.dart';
import 'package:flutter/material.dart';

class MyAppScafold extends StatelessWidget {
  final GlobalKey<ScaffoldState> key;
  final Widget body;
  final Widget appBar;

  MyAppScafold({this.key, this.body, this.appBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: appBar,
      drawer: MyAppDrawer(),
      body: body,
      backgroundColor: MyColors.black,
    );
  }
}
