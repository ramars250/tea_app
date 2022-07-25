import 'package:flutter/material.dart';
import 'package:tea_app/model/tea_list.dart';

class DetailPage extends StatelessWidget {
  final String routeName = 'detail-page';

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final teaTitle = routeArgs['title'];
    final cupSize = routeArgs['size'];
    final ice = routeArgs['ice'];
    final sweet = routeArgs['sweet'];
    final feed = routeArgs['feed'];

    return Column(
      children: [
        Text(teaTitle),
        Text(cupSize),
        Text(ice),
        Text(sweet),
      ],
    );
  }
}
