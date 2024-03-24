import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DormitoryPage(),
    );
  }
}

class DormitoryPage extends StatefulWidget {
  @override
  _DormitoryPageState createState() => _DormitoryPageState();
}

class _DormitoryPageState extends State<DormitoryPage> {
  int likes = 0;





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Общежития КубГАУ"),
          backgroundColor: Colors.lightGreen,),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://avatars.mds.yandex.net/get-altay/923092/2a000001873ae44bd0c02b417c3da85c73ca/L',
                height: 350,
                fit: BoxFit.cover,
              ),

            ],
          ),
        )
    );
  }
}
