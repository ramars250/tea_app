import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tea_app/model/customer_list.dart';
import 'package:tea_app/page/detail_page.dart';
import '../model/tea_list.dart';

class FrontPage extends StatefulWidget {
  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  //創一個名字為data屬於TeaData的列表
  List<TeaData> data = [];
  List<CustomerData> cData = [];
  int tap_index = 0;

  @override
  void initState() {
    super.initState();
    loadingTeaJsonData();
    loadingCustomeJsonrData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEA&TOP'),
        centerTitle: true,
      ),
      body: ListView(
        children: data.map((TeaData teaDataList) {
          return Card(
            color: Colors.lightBlue[100],
            child: ExpansionTile(
              expandedCrossAxisAlignment: CrossAxisAlignment.end,
              maintainState: true,
              title: Text(
                '${teaDataList.kindTitle}',
              ),
              children: [
                buildListView(teaDataList, context),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  //teaTitle列表
  Widget buildListView(TeaData teaDataList, BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: teaDataList.items.length,
        itemBuilder: (_, index) {
          final itemList = teaDataList.items[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (itemList) => DetailPage()));
                showDialog(
                    context: context,
                    builder: (_) {
                      return buildDetail(itemList, context);
                    });
              },
              leading: Container(
                width: 250,
                child: Text(itemList.itemTitle),
              ),
              title: Text('${itemList.coldPrice}'),
              trailing: itemList.hotPrice != null
                  ? Text('${itemList.hotPrice}')
                  : null,
              tileColor: Colors.black,
            ),
          );
        });
  }

  //杯型大小的程式
  Widget buildCupSize(BuildContext context, Item itemList) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        alignment: Alignment.centerLeft,
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, childAspectRatio: 2.5),
            //不可滑動
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemList.bPrice != null ? itemList.size.length : 1,
            itemBuilder: (_, index) {
              final size = itemList.size;
              final sizeList = size[index];
              bool tapped = index == tap_index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    print(index);
                    tap_index = index;
                  });
                },
                child: Container(
                    width: 50,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: tapped ? Colors.orange[300] : Colors.grey[300]),
                    child: Text(sizeList,
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center)),
              );
            }),
      );
    });
  }

  //選擇溫度程式
  Widget buildIce(BuildContext context, Item itemList) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          alignment: Alignment.centerLeft,
          height: 140,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5),
              physics: NeverScrollableScrollPhysics(),
              itemCount: itemList.hotPrice != null
                  ? cData[0].iceCubes.length
                  : cData[0].iceCubes.length - 2,
              itemBuilder: (_, index) {
                final ice = cData[0];
                final iceList = ice.iceCubes[index];
                bool tapped = index == tap_index;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // print("Tapped index: $index");
                      tap_index = index;
                    });
                  },
                  child: Container(
                      width: 50,
                      height: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color:
                              tapped ? Colors.orange[300] : Colors.grey[300]),
                      child: Text(iceList, style: TextStyle(fontSize: 12))),
                );
              }),
        );
      },
    );
  }

  //選擇甜度的程式
  Widget buildSewwt() {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        alignment: Alignment.centerLeft,
        height: 120,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2.5),
            physics: NeverScrollableScrollPhysics(),
            itemCount: cData[1].sewwtness.length,
            itemBuilder: (_, index) {
              final sewwt = cData[1];
              final sewwtList = sewwt.sewwtness[index];
              bool tapped = index == tap_index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    // print("Tapped index: $index");
                    tap_index = index;
                  });
                },
                child: Container(
                  width: 50,
                  height: 25,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: tapped ? Colors.orange[300] : Colors.grey[300]),
                  child: Text(sewwtList, style: TextStyle(fontSize: 12)),
                ),
              );
            }),
      );
    });
  }

  //客製化內容的程式
  Widget buildDetail(Item itemList, BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 35,
                    child: Text(itemList.itemTitle,
                        style: TextStyle(fontSize: 25)),
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          color: Colors.redAccent[100]),
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      )),
                ],
              ),
              SizedBox(height: 10),
              Container(
                  alignment: Alignment.centerLeft,
                  height: 25,
                  child: Text('訂購人姓名(非必填)')),
              Container(
                child: TextField(
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  autofocus: false,
                  decoration: InputDecoration(
                      //isCollapsed設為true，用來關閉預設輸入框
                      isCollapsed: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0)),
                      hintText: '非商品備註，僅提供填寫訂購人資訊'),
                ),
              ),
              SizedBox(height: 10),
              Text('杯型', style: TextStyle(fontSize: 16)),
              buildCupSize(context, itemList),
              Text('溫度', style: TextStyle(fontSize: 16)),
              buildIce(context, itemList),
              Text('糖度', style: TextStyle(fontSize: 16)),
              buildSewwt(),
              buildFeed(),
              SizedBox(height: 5),
              Divider(height: 1.5, color: Colors.grey),
              Container(
                  height: 80,
                  padding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(child: Text('總金額${itemList.coldPrice}元')),
                          Container(child: Text('數量條還沒做'))
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.lightBlue[300],
                        ),
                        child: TextButton(
                            child: Text(
                              '訂購',
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            }),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
  //選擇加料的程式
  ExpansionTile buildFeed() {
    return ExpansionTile(
              title: Text('加料(最多可選2項)', style: TextStyle(fontSize: 16)),
              children: [
                GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2.5),
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cData[2].feed.length,
                    itemBuilder: (_, index) {
                      final feedList = cData[2].feed[index];
                      return Container(
                        width: 50,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                            color: Colors.orange[300]),
                        child: Text(feedList,
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center),
                      );
                    }),
              ],
            );
  }

  //解析tea.json資料
  Future<TeaList> loadingTeaJsonData() async {
    // 設字串變數listJson等於本地json內容
    String jsonData = await rootBundle.loadString('assets/json/tea.json');
    //設變數jsonResponse為json解碼後的內容
    final jsonResponse = json.decode(jsonData);
    //設TeaList的類型為list的teaData為TeaList反序列化的內容
    TeaList teaData = TeaList.fromJson(jsonResponse);
    //更新狀態，將teaData.teaData的反序列化內容指定給先前建立的data列表，方便需要使用的時候可用
    setState(() {
      this.data = teaData.teaData;
    });
    return teaData;
  }

  //解析customized.json資料
  Future<CustomerList> loadingCustomeJsonrData() async {
    String jsonData =
        await rootBundle.loadString('assets/json/customized.json');
    final jsonResponse = json.decode(jsonData);
    CustomerList customerData = CustomerList.fromJson(jsonResponse);
    // print(customerData.cData[0].iceCubes);
    setState(() {
      this.cData = customerData.cData;
    });
    return customerData;
  }
}
