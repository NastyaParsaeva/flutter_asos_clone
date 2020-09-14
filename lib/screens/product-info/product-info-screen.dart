import 'package:asos_clone/common/my-app-bar.dart';
import 'package:asos_clone/consts/MyColors.dart';
import 'package:flutter/material.dart';

class ProductInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: 'Информация о товаре',
      ),
      backgroundColor: MyColors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Блузка ASOS DESIGN',
                style: TextStyle(
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Код товара'.toUpperCase(),
                style: TextStyle(
                  color: MyColors.disabledGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1718595',
                style: TextStyle(
                  color: MyColors.white,
                ),
              ),
              Text(
                'Бренд'.toUpperCase(),
                style: TextStyle(
                  color: MyColors.disabledGray,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'В моделях от ASOS DESIGN вы всегда выглядите остромодно вне зависимости от того, кто вы, откуда и чем занимаетесь. Эксклюзивно для ASOS наш универсальный бренд предлагает коллекции моделей с учетом всех особенностей вашей фигуры: ASOS Curve, Tall, Petite и Maternity. Мы создаем вещи - вы создаете стиль.',
                style: TextStyle(
                  color: MyColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
