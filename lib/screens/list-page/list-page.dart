import 'dart:developer';

import 'package:asos_clone/screens/list-page/product-list-item.dart';
import 'package:asos_clone/screens/list-page/product-list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListPage extends StatelessWidget {
  List<ProductListItemType> _products() {
    return [
      new ProductListItemType(
          id: 9,
          name:
              'Приталенное чайное платье с цветочным принтом John Zack Petite',
          price: '4 790,00 руб.',
          imageUrl:
              'https://images.asos-media.com/products/pritalennoe-chajnoe-plate-s-tsvetochnym-printom-john-zack-petite/21192751-1-multi',
          isFavorited: true,
          color: 'Черный/белый/цветочный принт',
          size: '38',
          productDetails:
              'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
      new ProductListItemType(
          id: 15,
          name:
              'Блестящее атласное платье-комбинация мини со шнуровкой на спине ASOS DESIGN',
          price: '3 390,00 руб.',
          imageUrl:
              'http://images.asos-media.com/products/blestyaschee-atlasnoe-plate-kombinatsiya-mini-so-shnurovkoj-na-spine-asos-design/20041579-1-black',
          isFavorited: false,
          color: 'Синий',
          size: '38-40',
          productDetails:
              'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
      new ProductListItemType(
          id: 88,
          name:
              'Черное облегающее платье миди с контрастными ремешками ASOS DESIGN',
          price: '3 690,00 руб.',
          imageUrl:
              'http://images.asos-media.com/products/chernoe-oblegayuschee-plate-midi-s-kontrastnymi-remeshkami-asos-design/20493693-1-mono',
          isFavorited: false,
          color: 'Ярко-оранжевый',
          size: '50',
          productDetails:
              'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
      new ProductListItemType(
          id: 24,
          name: 'Атласное платье макси с цветочным принтом ASOS EDITION',
          price: '8 090,00 руб.',
          imageUrl:
              'https://images.asos-media.com/products/atlasnoe-plate-maksi-s-tsvetochnym-printom-asos-edition/14563661-1-multi',
          isFavorited: false,
          color: 'Яркий цветочный принт',
          size: '54',
          productDetails:
              'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
      new ProductListItemType(
          id: 66,
          name: 'Платье макси с платочным принтом John Zack',
          price: '5 590,00 руб.',
          imageUrl:
              'https://images.asos-media.com/products/plate-maksi-s-platochnym-printom-john-zack/21188039-1-multi',
          isFavorited: true,
          color: 'Мульти',
          size: 'EU 34',
          productDetails:
              'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
      new ProductListItemType(
          id: 48,
          name: 'Красное платье мидакси с оборками Never Fully Dressed',
          price: '8 590,00 руб.',
          imageUrl:
              'https://images.asos-media.com/products/krasnoe-plate-midaksis-oborkaminever-fully-dressed/20931336-1-redmulti',
          isFavorited: true,
          color: 'Dusty mint',
          size: 'EU 34',
          productDetails:
              'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
      new ProductListItemType(
          id: 31,
          name:
              'Свободное коричневое платье из органзы с цветочным принтом Object',
          price: '6 290,00 руб.',
          imageUrl:
              'https://images.asos-media.com/products/svobodnoe-korichnevoe-plate-iz-organzy-s-tsvetochnym-printom-object/20545782-1-multi',
          isFavorited: true,
          color: 'Мульти',
          size: '40',
          productDetails:
              'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новинки: одежда'),
        leading: BackButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () => {log('open wishlist')},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => {log('search')},
          ),
        ],
        backgroundColor: Color(0xff333333),
      ),
      body: ProductList(
        products: _products(),
      ),
      backgroundColor: Color(0xff000000),
    );
  }
}
