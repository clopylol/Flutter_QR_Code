import 'package:flutter/material.dart';
import 'package:flutter_qrcode_v1/helpers/styles/color_style.dart';

//Bottom Navigator Bar
Widget bottomNavigatorBarWidget(BuildContext context) {
  return BottomAppBar(
    shape: CircularNotchedRectangle(),
    color: colorPrimary,
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              iconSize: 35,
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () => Navigator.pushNamed(context, '/')),
          IconButton(
              iconSize: 35,
              icon: Icon(Icons.bar_chart_rounded),
              color: Colors.white,
              onPressed: () => Navigator.pushNamed(context, '/generatePage')),
        ],
      ),
    ),
  );
}
