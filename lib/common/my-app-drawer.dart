import 'dart:ui';

import 'package:asos_clone/consts/MyColors.dart';
import 'package:asos_clone/models/MenuItem.model.dart';
import 'package:flutter/material.dart';

final List<MenuItem> menuItemsList = [
  new MenuItem(name: 'Главная', icon: Icons.home),
  new MenuItem(name: 'Корзина', icon: Icons.shopping_basket),
  new MenuItem(name: 'Избранное', icon: Icons.favorite_border),
  new MenuItem(name: 'Выйти', icon: Icons.exit_to_app),
];

class MyAppDrawer extends StatefulWidget {
  @override
  _MyAppDrawerState createState() => _MyAppDrawerState();
}

class _MyAppDrawerState extends State<MyAppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyColors.black,
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                color: MyColors.red,
                alignment: AlignmentDirectional.center,
                child: Text(
                  'Привет, <Имя пользователя>',
                  style: TextStyle(color: MyColors.white),
                ),
              ),
              // padding: EdgeInsets.all(8),
            ),
            ListView.builder(
              itemCount: menuItemsList.length,
              shrinkWrap: true,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    menuItemsList[index].icon,
                    color: MyColors.white,
                  ),
                  title: Text(
                    menuItemsList[index].name,
                    style: TextStyle(color: MyColors.white),
                  ),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
