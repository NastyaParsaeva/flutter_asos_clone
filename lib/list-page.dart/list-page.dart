import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новинки: одежда'),
        leading: BackButton(),
        actions: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.favorite_border),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.search),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      body: Center(child: Text('listpage')),
    );
  }
}
