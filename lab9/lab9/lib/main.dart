import 'package:flutter/material.dart';
import 'package:lab/classes/Machine.dart';

void main() {
  CoffeeMachine coffeeMachine = CoffeeMachine(1000, 1000, 1000, 0);

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Кофемашина')),
      body: CoffeeMachineApp(coffeeMachine),
    ),
  ));
}

class CoffeeMachineApp extends StatefulWidget {
  final CoffeeMachine coffeeMachine;

  CoffeeMachineApp(this.coffeeMachine);

  @override
  _CoffeeMachineAppState createState() => _CoffeeMachineAppState();
}

class _CoffeeMachineAppState extends State<CoffeeMachineApp> {
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextButton(
            onPressed: () {
              _message = widget.coffeeMachine.makingCoffee();
              setState(() {});
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              minimumSize: MaterialStateProperty.all<Size>(Size(250, 60)),
            ),
            child: Text('Приготовить кофе'),
          ),
          SizedBox(height: 20),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Добавить ресурс'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResource('coffee', 50);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Добавить кофейные зерна (+50)'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResource('milk', 100);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Добавить молоко (+100 мл)'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResource('water', 100);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Добавить воду (+100 мл)'),
                      ),
                    ],
                  ),
                ),
              );
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              minimumSize: MaterialStateProperty.all<Size>(Size(250, 60)),
            ),
            child: Text('Добавить ресурс'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SizedBox(),
          ),
          Text(_message),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
            ),
            child: Text('Выход'),
          ),
        ],
      ),
    );
  }
}