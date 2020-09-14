import 'package:asos_clone/consts/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetailsPicture extends StatelessWidget {
  final List<String> productImages;
  final Function onBackClick;
  final Function onShareClick;

  ProductDetailsPicture({
    this.productImages,
    this.onBackClick,
    this.onShareClick,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: NetworkImage(this.productImages[0]),
          width: 2000,
          fit: BoxFit.cover,
        ),
        AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: BackButton(
            color: MyColors.black,
            onPressed: onBackClick,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.share,
                color: MyColors.black,
              ),
              onPressed: onShareClick,
            )
          ],
        )
      ],
    );
  }
}
