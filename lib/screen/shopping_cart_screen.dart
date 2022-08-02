import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tea_app/model/detail_model.dart';
// import 'package:tea_app/page/front_screen.dart';

class ShoppingCartScreen extends StatelessWidget {
  final String routeName = 'detail-page';
  final DetailList detailList;

  ShoppingCartScreen({Key key, @required this.detailList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(detailList.detailList[1].title);
    // print(detailList.detailList.length);
    return Scaffold(
      appBar: AppBar(
        title: Text('購物車'),
      ),
      body: ListView.builder(
        itemCount: detailList.detailList.length,
        itemBuilder: (_, index) {
          final allList = detailList.detailList[index];
          return Container(
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.centerLeft,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    allList.orderName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    allList.title,
                    style: TextStyle(fontSize: 36),
                  ),
                  Row(
                    children: [
                      Text(
                        allList.cupSize,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 5),
                      Text(
                        allList.iceCube,
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 5),
                      Text(
                        allList.sweet,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
