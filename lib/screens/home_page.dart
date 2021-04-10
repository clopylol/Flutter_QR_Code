import 'package:flutter/material.dart';
import 'package:flutter_qrcode_v1/helpers/styles/color_style.dart';
import 'package:flutter_qrcode_v1/screens/scanner_page.dart';
import 'package:flutter_qrcode_v1/widgets/app_bar_widget.dart';
import 'package:flutter_qrcode_v1/widgets/bottomAppBar/bottom_app_bar_widget.dart';
import 'package:flutter_qrcode_v1/widgets/bottomAppBar/floatting_action_button_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(title: "QR Code Flutter", context: context),
      bottomNavigationBar: bottomNavigatorBarWidget(context),
      floatingActionButton: floatingActionButtonWidget(
          context, Icons.qr_code_scanner_rounded, '/scannerPage'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Home Sayfasındaki Bodyde Bulunan Başlık
              homePageBodyTitle(),
              SizedBox(height: 50),
              //Yönlendirici Buttonlar
              elevatedButtonWidget(
                  buttonText: "QR Oluştur",
                  buttonColor: colorPrimary,
                  route: '/generatePage'),
              SizedBox(height: 20),
              elevatedButtonWidget(
                  buttonText: "QR Tarayıcı",
                  buttonColor: colorSecondary,
                  route: '/scannerPage'),
            ],
          ),
        ),
      ),
    );
  }

  //Home Page Elevated Button Widget
  Widget elevatedButtonWidget(
      {@required String buttonText, Color buttonColor, String route}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '$route');
      },
      child: Text('$buttonText'),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
      ),
    );
  }

  //Home Sayfasındaki Bodyde Bulunan Başlık
  Widget homePageBodyTitle() {
    return Text(
      "Flutter ile QR Code İşlemleri",
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.headline3.copyWith(color: colorSecondary),
    );
  }
}
