import 'package:flutter/material.dart';
import './List.dart';


class ItemScreen extends StatelessWidget {
  var item;
  var context;
  ItemScreen(this.item, this.context){}
  @override
  Widget build (BuildContext ctxt) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(item["author"]),
      ),
      body: Center(
        child: Text(item["en"])
      ),
    );
  }
}