import 'package:flutter/material.dart';
import 'package:tea_app/screen/shopping_cart_screen.dart';
import 'screen/front_screen.dart';

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
        '/': (ctx) => FrontScreen(),
        ShoppingCartScreen().routeName: (ctx) => ShoppingCartScreen(),
      },
    );
  }
}

