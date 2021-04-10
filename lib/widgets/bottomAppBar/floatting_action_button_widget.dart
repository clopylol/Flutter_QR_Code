import 'package:flutter/material.dart';
import 'package:flutter_qrcode_v1/helpers/styles/color_style.dart';

//Bottom Navigator Bardaki Yuvarlak Button
Widget floatingActionButtonWidget(
    BuildContext context, IconData icon, String route) {
  return FloatingActionButton(
    backgroundColor: colorPrimary,
    splashColor: Colors.green[300],
    onPressed: () {
      Navigator.pushNamed(context, route);
    },
    child: Icon(
      icon,
      size: 35,
    ),
  );
}
