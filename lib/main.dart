import 'package:tea_app/page/detail_page.dart';

import 'page/front_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(TeaApp());

class TeaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FrontPage(),
      routes: {
        '/': (ctx) => FrontPage(),
        DetailPage().routeName: (ctx) => DetailPage(),
      },
    );
  }
}

