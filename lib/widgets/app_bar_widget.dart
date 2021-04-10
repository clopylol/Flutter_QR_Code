import 'package:flutter/material.dart';
import 'package:flutter_qrcode_v1/helpers/styles/color_style.dart';

Widget appBarWidget({String title, bool center: false, BuildContext context}) {
  return AppBar(
    backgroundColor: colorPrimary,
    title: Text(title),
    centerTitle: center,
    actions: [
      IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            Navigator.pushNamed(context, '/testPage');
          }),
      IconButton(icon: Icon(Icons.list), onPressed: () {}),
    ],
  );
}
