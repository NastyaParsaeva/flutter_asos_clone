import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';

// typedef IndexCallback = void Function(int index);

class ProductDetailSizePicker extends StatelessWidget {
  final List<String> sizeList;
  final void Function(int index) onSizeSelect;

  ProductDetailSizePicker({
    this.sizeList,
    this.onSizeSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xff000000),
        child: Column(
          children: [
            Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'РАЗМЕРНОСТИ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color(0xff2d2d2d),
                  ),
                ),
              ],
            ),
            ListView.builder(
              itemCount: this.sizeList?.length,
              shrinkWrap: true,
              // itemExtent: 40,
              padding: EdgeInsets.all(0),
              itemBuilder: (context, index) {
                return ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    title: Text(
                      sizeList[index],
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      onSizeSelect(index);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
