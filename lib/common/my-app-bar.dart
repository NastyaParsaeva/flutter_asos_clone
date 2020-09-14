import 'dart:developer';
import 'dart:ui';

import 'package:asos_clone/consts/MyColors.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final bool isWithBackButton;
  final Widget leading;
  final List<Widget> actions;

  MyAppBar({
    this.titleText,
    this.isWithBackButton,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading != null
          ? leading
          : BackButton(
              onPressed: () => Navigator.pop(context),
            ),
      titleSpacing: 0,
      title: Title(
        child: Text(
          titleText.toUpperCase(),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.white,
      ),
      backgroundColor: MyColors.appBarGray,
      toolbarHeight: 50,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50);

  void onBackButtonPress(context) => Navigator.pop(context);
}
