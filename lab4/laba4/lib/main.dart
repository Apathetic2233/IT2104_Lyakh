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

  void incrementLikes() {
    setState(() {
      likes++;
    });
  }
  void shareDormitory() {
    Share.share('Поделиться информацией об общежитии');
  }
  void copyAddress() {
    Clipboard.setData(ClipboardData(text: "г. Краснодар, ул. Калинина 13/20"));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Адрес скопирован в буфер обмена'),
    ));
  }
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Общежитие 20",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "г. Краснодар, ул. Калинина 13/20",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: incrementLikes,
                          ),
                          Text("$likes"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.phone, color: Colors.lightGreen),
                            onPressed: () async{
                              final Uri url = Uri(
                                scheme: 'tel',
                                path: "79628784200",
                              );
                              if (await canLaunchUrl(url)){
                                await launchUrl(url);
                              } else{
                                print('Не удалось дозвониться');
                              }
                            },
                          ),
                          Text('Звонок'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.directions, color: Colors.lightGreen),
                            onPressed: copyAddress,
                          ),
                          Text('Навигация'),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              icon: Icon(Icons.share, color: Colors.lightGreen),
                              onPressed: shareDormitory),
                          Text('Поделиться'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
