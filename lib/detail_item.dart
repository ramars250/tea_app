import 'package:flutter/material.dart';
import 'package:tea_app/screen/shopping_cart_screen.dart';

class DetailItem extends StatelessWidget {
  final String teaTitle;
  final String cupSize;
  final String ice;
  final String sewwt;
  final String feed;

  DetailItem(this.teaTitle, this.cupSize, this.ice, this.sewwt, this.feed);

  void selectedList(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      ShoppingCartScreen().routeName,
      arguments: {
        'title': teaTitle,
        'size': cupSize,
        'ice': ice,
        'sewwt': sewwt,
        'feed': feed,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
