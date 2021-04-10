import 'package:flutter/material.dart';
import 'package:flutter_qrcode_v1/helpers/styles/color_style.dart';
import 'package:flutter_qrcode_v1/screens/generate_page.dart';
import 'package:flutter_qrcode_v1/screens/home_page.dart';
import 'package:flutter_qrcode_v1/screens/scanner_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Qr Code',
      theme: ThemeData(
        primaryColor: colorPrimary,
        accentColor: colorSecondary,
      ),
      routes: {
        '/': (context) => HomePage(), //Geçerli Sayfa
        '/generatePage': (context) => GeneratePage(),
        '/scannerPage': (context) => ScannerPage(),
      },
      //Route Listimizde olmayan bir route geldiyse hata döndür.
      //Burası için bir error page tasarımı yapılabilir.
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Text('Bir şeyler ters gitti. Böyle bir sayfa bulunmuyor.'),
          ),
        ),
      ),
    );
  }
}
