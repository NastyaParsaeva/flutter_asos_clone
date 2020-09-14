import 'dart:developer';

import 'package:flutter/material.dart';

class ProductDetailsSize extends StatelessWidget {
  final List<String> sizeList;
  final int selectedSizeIndex;
  final Function onSizePress;

  ProductDetailsSize({
    this.sizeList,
    this.selectedSizeIndex,
    this.onSizePress,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: isSizesEmpty ? null : onSizePress,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: Text(
                sizeValue,
                style: TextStyle(
                  color: isSizesEmpty ? Color(0xff999999) : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(
              isSizesEmpty ? null : Icons.keyboard_arrow_down,
              color: Colors.white,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }

  bool get isSizesEmpty {
    return sizeList == null || sizeList?.length == 0;
  }

  String get sizeValue {
    if (isSizesEmpty) {
      return 'ОДИН РАЗМЕР';
    } else if (selectedSizeIndex == -1) {
      return 'РАЗМЕР';
    }
    return sizeList[selectedSizeIndex];
  }
}
