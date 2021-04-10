import 'package:flutter/material.dart';
import 'package:flutter_qrcode_v1/helpers/styles/color_style.dart';
import 'package:flutter_qrcode_v1/widgets/bottomAppBar/bottom_app_bar_widget.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GeneratePage extends StatefulWidget {
  GeneratePage({Key key}) : super(key: key);

  @override
  _GeneratePageState createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage> {
  //Varsayılan Qr linki
  String qrDataString = "https://github.com/clopylol";
  //App Bar Başlığı
  final String _appBarTitle = "QR Code Oluştur";
  //Bodydeki Başlık
  final String _bodyTitle =
      "QR Code Oluşturmak İstediğiniz Veriyi Girin (Link/Data vs.)";
  //Kullancıdan gelecek veriyi alacağız.
  TextEditingController qrTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: generatePageAppBar(title: _appBarTitle),
      bottomNavigationBar: bottomNavigatorBarWidget(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //QR Code Widgetı
              generatePageQrCode(),
              SizedBox(height: 20),
              //Karekod Altındaki Başlık
              generatePageBodyTitle(_bodyTitle),
              SizedBox(height: 20),
              //Kullanıcıdan bir data alıp onunla oluşturalım.
              generatePageTextField(),
              SizedBox(height: 10),
              //QR Code oluşturmamızı sağlayan button.
              generatePageElevatedButton(buttonText: "QR Code Oluştur"),
            ],
          ),
        ),
      ),
    );
  }

  Widget generatePageAppBar({@required String title}) {
    return AppBar(
      title: Text('$title'),
      centerTitle: true,
      backgroundColor: colorPrimary,
    );
  }

  Widget generatePageQrCode() {
    return QrImage(
      data: qrDataString,
      size: 300,
    );
  }

  Widget generatePageBodyTitle(String title) {
    return Text(
      '$title',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline6.copyWith(
            color: colorSecondary,
          ),
    );
  }

  //QR Code'a dönüştürülmek istenilen stringi alalım.
  Widget generatePageTextField() {
    return TextField(
      controller: qrTextController,
      decoration: InputDecoration(
        hintText: "Linki Buraya Ekleyin",
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.qr_code_scanner),
        labelText: "Oluşturulacak QR Kodun Linki",
      ),
    );
  }

  //Qr Code Oluştuğu Zaman Bilgi Verelim.
  _showAlert({String alertTxt, Color alertColor}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: alertColor,
        content: Text('$alertTxt'),
        //duration: Duration(seconds: 2),
        action: SnackBarAction(
          textColor: Colors.white,
          label: 'Tamam',
          onPressed: () {},
        ),
      ),
    );
  }

  Widget generatePageElevatedButton({@required String buttonText}) {
    return ElevatedButton(
      onPressed: () {
        //Kullanıcı herhangi bir veri girmediyse
        if (qrTextController.text.isEmpty) {
          setState(() {
            qrDataString = "https://github.com/salihacr";
            _showAlert(
                alertTxt:
                    "Herhangi bir veri girmediniz. Varsayılan Link için Qr Code oluşturuldu.",
                alertColor: Colors.red);
          });
          //Kullanıcı bir veri girdiyse,
        } else {
          setState(() {
            qrDataString = qrTextController.text;
            _showAlert(
                alertTxt:
                    "$qrDataString adresi için QR Code başarıyla oluşturuldu.",
                alertColor: Colors.green);

            //QR Code oluştuktan sonra text controllerın içerisini temizleyelim.
            qrTextController.clear();
          });
        }
      },
      child: Text('$buttonText'),
      style: ElevatedButton.styleFrom(
        primary: colorPrimary,
      ),
    );
  }
}
