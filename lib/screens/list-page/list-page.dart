import 'dart:developer';

import 'package:asos_clone/common/my-app-bar.dart';
import 'package:asos_clone/consts/MyColors.dart';
import 'package:asos_clone/models/Product.dart';
// import 'package:asos_clone/screens/list-page/product-list-item.dart';
import 'package:asos_clone/screens/list-page/product-list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<List<Product>> fetchProductList() async {
  final http.Response response =
      await http.Client().get('http://192.168.1.69:8000/product-list');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log(response.toString());
    Iterable decodedBody = json.decode(response.body);
    log(decodedBody.toString());
    // myModels = (json.decode(response.body) as List)
    //     .map((i) => MyModel.fromJson(i))
    //     .toList();
    // List<Product> productList = List<Product>.from(decodedBody)
    //     .map((Map item) => Product.fromJson(item))
    //     .toList();
    List<Product> productList =
        (decodedBody as List).map((e) => Product.fromJson(e)).toList();
    return productList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future<List<Product>> futureProductList;

  @override
  void initState() {
    super.initState();
    futureProductList = fetchProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: 'Новинки: одежда',
        leading: IconButton(
            icon: Icon(Icons.menu), onPressed: () => {log('menu click')}),
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
      ),
      body: FutureBuilder(
          future: futureProductList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ProductList(
                products: snapshot.data,
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
      backgroundColor: MyColors.black,
    );
  }
}

// class ListPage extends StatelessWidget {

//   Future<List<Product>> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   List<ProductListItemType> _products() {
//     return [
//       new ProductListItemType(
//           id: 9,
//           name:
//               'Приталенное чайное платье с цветочным принтом John Zack Petite',
//           price: '4 790,00 руб.',
//           imageUrl:
//               'https://images.asos-media.com/products/pritalennoe-chajnoe-plate-s-tsvetochnym-printom-john-zack-petite/21192751-1-multi',
//           isFavorited: true,
//           color: 'Черный/белый/цветочный принт',
//           sizeList: ['36', '38', '38/40', '40', '42/44', '46', '48', '50'],
//           productDetails:
//               'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
//       new ProductListItemType(
//           id: 15,
//           name:
//               'Блестящее атласное платье-комбинация мини со шнуровкой на спине ASOS DESIGN',
//           price: '3 390,00 руб.',
//           imageUrl:
//               'http://images.asos-media.com/products/blestyaschee-atlasnoe-plate-kombinatsiya-mini-so-shnurovkoj-na-spine-asos-design/20041579-1-black',
//           isFavorited: false,
//           color: 'Синий',
//           sizeList: ['XS - 40', 'S - 42/44', 'M - 46', 'L - 48', 'XL - 50'],
//           productDetails:
//               'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
//       new ProductListItemType(
//           id: 88,
//           name:
//               'Черное облегающее платье миди с контрастными ремешками ASOS DESIGN',
//           price: '3 690,00 руб.',
//           imageUrl:
//               'http://images.asos-media.com/products/chernoe-oblegayuschee-plate-midi-s-kontrastnymi-remeshkami-asos-design/20493693-1-mono',
//           isFavorited: false,
//           color: 'Ярко-оранжевый',
//           sizeList: [
//             'XXS - 38/40',
//             'XS - 40',
//             'S - 42/44',
//             'M - 46',
//             'L - 48',
//             'XL - 50'
//           ],
//           productDetails:
//               'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
//       new ProductListItemType(
//           id: 24,
//           name: 'Атласное платье макси с цветочным принтом ASOS EDITION',
//           price: '8 090,00 руб.',
//           imageUrl:
//               'https://images.asos-media.com/products/atlasnoe-plate-maksi-s-tsvetochnym-printom-asos-edition/14563661-1-multi',
//           isFavorited: false,
//           color: 'Яркий цветочный принт',
//           sizeList: ['XS', 'S', 'M', 'L', 'XL'],
//           productDetails:
//               'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
//       new ProductListItemType(
//           id: 66,
//           name: 'Платье макси с платочным принтом John Zack',
//           price: '5 590,00 руб.',
//           imageUrl:
//               'https://images.asos-media.com/products/plate-maksi-s-platochnym-printom-john-zack/21188039-1-multi',
//           isFavorited: true,
//           color: 'Мульти',
//           sizeList: [
//             'EU 32',
//             'EU 34',
//             'EU 36',
//             'EU 38',
//             'EU 40',
//             'EU 42',
//             'EU 44'
//           ],
//           productDetails:
//               'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
//       new ProductListItemType(
//           id: 48,
//           name: 'Красное платье мидакси с оборками Never Fully Dressed',
//           price: '8 590,00 руб.',
//           imageUrl:
//               'https://images.asos-media.com/products/krasnoe-plate-midaksis-oborkaminever-fully-dressed/20931336-1-redmulti',
//           isFavorited: true,
//           color: 'Dusty mint',
//           sizeList: ['38/40', '40', '42/44', '46', '48', '50'],
//           productDetails:
//               'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
//       new ProductListItemType(
//           id: 31,
//           name:
//               'Свободное коричневое платье из органзы с цветочным принтом Object',
//           price: '6 290,00 руб.',
//           imageUrl:
//               'https://images.asos-media.com/products/svobodnoe-korichnevoe-plate-iz-organzy-s-tsvetochnym-printom-object/20545782-1-multi',
//           isFavorited: true,
//           color: 'Мульти',
//           sizeList: null,
//           productDetails:
//               'Гладкая ткань. Легкий и воздушный дизайн. Материал: 100% полиэстер.'),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         titleText: 'Новинки: одежда',
//         leading: IconButton(
//             icon: Icon(Icons.menu), onPressed: () => {log('menu click')}),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.favorite_border),
//             onPressed: () => {log('open wishlist')},
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () => {log('search')},
//           ),
//         ],
//       ),
//       body: ProductList(
//         products: _products(),
//       ),
//       backgroundColor: MyColors.black,
//     );
//   }
// }
