import 'package:flutter/material.dart';
import 'package:tea_app/page/front_page.dart';

class DetailPage extends StatelessWidget {
  final String routeName = 'detail-page';
  final DetailItems detailitems;
  DetailPage({Key key, @required this.detailitems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(detailitems.title);
    return Scaffold(
      appBar: AppBar(
        title: Text('購物車'),
      ),
      body: Column(
        children: [
          Container(
            child: Text(detailitems.orderName),
          ),
          Container(
            child: Text(detailitems.title),
          ),
          Container(
            child: Text(detailitems.cupSize),
          ),
          Container(
            child: Text(detailitems.iceCube),
          ),
          Container(
            child: Text(detailitems.sweet),
          ),
        ],
      ),
    );
  }
}
