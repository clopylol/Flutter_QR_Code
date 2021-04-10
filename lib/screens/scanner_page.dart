import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_qrcode_v1/helpers/styles/color_style.dart';
import 'package:flutter_qrcode_v1/widgets/bottomAppBar/bottom_app_bar_widget.dart';
import 'package:flutter_qrcode_v1/widgets/bottomAppBar/floatting_action_button_widget.dart';

class ScannerPage extends StatefulWidget {
  ScannerPage({Key key}) : super(key: key);

  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  final String _appBarTitle = "QR Code Tarama Sayfası";
  final String _title = "Sonuç";
  final String _buttonTxt = "QR Code Tara";

  String qrCodeResult = "Herhangi bir tarama işlemi yapılmadı.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: scannerPageAppBar(appBarTitle: _appBarTitle),

      //Bottom Navigation Bar
      bottomNavigationBar: bottomNavigatorBarWidget(context),

      //Floating Action Button ve Konumu
      floatingActionButton: floatingActionButtonWidget(
          context, Icons.qr_code_scanner_rounded, null),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //Body
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Sayfa Başlığı
              scannerPageTitle(title: _title),
              //Divider
              scannerPageDivider(),
              SizedBox(height: 20),
              //QR Code'un döndüğü sonuç.
              scannerPageResult(),
              SizedBox(height: 30),
              //QR Code okuyucuyu açan button.
              scannerPageElevatedButton(buttonText: _buttonTxt)
            ],
          ),
        ),
      ),
    );
  }

  //Scanner Page QR Code Reader Button
  Widget scannerPageElevatedButton({@required String buttonText}) {
    return ElevatedButton(
      onPressed: () async {
        String qrCodeScanner = await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", "İPTAL", true, ScanMode.QR);
        setState(() {
          qrCodeResult = qrCodeScanner;
        });
      },
      child: Text('$buttonText'),
      style: ElevatedButton.styleFrom(
        primary: colorSecondary,
      ),
    );
  }

  ////Scanner Page App Bar
  Widget scannerPageAppBar({String appBarTitle}) {
    return AppBar(
      title: Text('$appBarTitle'),
      centerTitle: true,
      backgroundColor: colorPrimary,
    );
  }

  //Scanner Page Başlık Altındaki Divider
  Widget scannerPageDivider() {
    return Divider(
      thickness: 2,
      endIndent: 80,
      indent: 80,
      color: colorSecondary,
    );
  }

  //Scanner Page Başlık.
  Widget scannerPageTitle({String title}) {
    return Text(
      '$title',
      style:
          Theme.of(context).textTheme.headline4.copyWith(color: colorSecondary),
    );
  }

  //QR Kod için kamera açıldıktan sonra eğer kod okunursa kodun içeriğini döndür, eğer geri buttonuna tıklanırsa -1 dönüyor.
  Widget scannerPageResult() {
    return qrCodeResult == "-1"
        ? Text(
            "QR Code Bulunamadı",
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: colorPrimary),
          )
        : Text(
            "$qrCodeResult",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: colorPrimary),
          );
  }
}
