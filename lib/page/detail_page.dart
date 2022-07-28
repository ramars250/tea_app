import 'package:flutter/material.dart';
import 'package:tea_app/page/front_page.dart';

class DetailPage extends StatelessWidget {
  final String routeName = 'detail-page';
  final DetailList detailList;
  DetailPage({Key key, @required this.detailList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(detailList.detailList[1].title);
    // print(detailList.detailList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('購物車'),
      ),
      body: Column(
        children: [
          Container(
            child: Text('0'),
          ),
          Container(
            child: Text('1'),
          ),
          Container(
            child: Text('2'),
          ),
          Container(
            child: Text('3'),
          ),
          Container(
            child: Text('4'),
          ),
        ],
      ),
    );
  }
}
