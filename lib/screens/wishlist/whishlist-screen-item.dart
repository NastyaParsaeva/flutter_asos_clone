import 'dart:developer';

import 'package:asos_clone/consts/MyColors.dart';
import 'package:flutter/material.dart';

class WishlistItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Image(
              image: NetworkImage(
                "https://images.asos-media.com/products/belaya-hlopkovaya-futbolka-s-tsvetochnym-printommonki/20958146-1-white",
              ),
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Красные стразы для лица на хеллоуин блаблабла',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: MyColors.white,
                ),
              ),
              Text(
                '790,00 руб.',
                style: TextStyle(
                  color: MyColors.white,
                ),
              ),
              Text(
                'No Size / Красный',
                style: TextStyle(
                  color: MyColors.white,
                ),
              ),
              RaisedButton(
                color: MyColors.green,
                child: Text(
                  'Отправить в корзину'.toUpperCase(),
                  style: TextStyle(color: MyColors.white),
                ),
                onPressed: () => {log('cart button press')},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
