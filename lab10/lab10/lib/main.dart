import 'package:flutter/material.dart';
import 'package:lab10/classes/CoffeeMachine.dart';
import 'package:lab10/classes/Enums.dart';
import 'package:lab10/classes/Resources.dart';
import 'package:lab10/classes/ICoffee.dart';
import 'package:lab10/classes/Coffee.dart';

void main() {
  CoffeeMachine coffeeMachine = CoffeeMachine(Resources(1000, 1000, 1000, 0));

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
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Выберите вид кофе'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          try {
                            ICoffee coffee = getCoffeeByType(CoffeeType.Espresso);
                            Resources resources = widget.coffeeMachine.makeCoffeeByType(coffee);
                            _message = 'Ваш эспрессо готов!';
                            setState(() {});
                          } catch (e) {
                            _message = e.toString();
                          }
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Эспрессо'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          try {
                            ICoffee coffee = getCoffeeByType(CoffeeType.Cappuccino);
                            Resources resources = widget.coffeeMachine.makeCoffeeByType(coffee);
                            _message = 'Ваш капучино готов!';
                            setState(() {});
                          } catch (e) {
                            _message = e.toString();
                          }
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Капучино'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          try {
                            ICoffee coffee = getCoffeeByType(CoffeeType.Latte);
                            Resources resources = widget.coffeeMachine.makeCoffeeByType(coffee);
                            _message = 'Ваш латте готов!';
                            setState(() {});
                          } catch (e) {
                            _message = e.toString();
                          }
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Латте'),
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
            child: Text('Приготовить кофе'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text('Добавить ресурсы'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResources(100, 0, 0, 0);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Добавить кофейные зерна'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResources(0, 100, 0, 0);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Добавить молоко'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResources(0, 0, 100, 0);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Добавить воду'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          widget.coffeeMachine.addResources(0, 0, 0, 10);
                          Navigator.pop(context);
                        },
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          minimumSize: MaterialStateProperty.all<Size>(Size(200, 40)),
                        ),
                        child: Text('Добавить деньги'),
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
            child: Text('Добавить ресурсы'),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SizedBox(),
          ),
          Text(_message),
          ElevatedButton(
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

  ICoffee getCoffeeByType(CoffeeType type) {
    switch (type) {
      case CoffeeType.Espresso:
        return Espresso();
      case CoffeeType.Cappuccino:
        return Cappuccino();
      case CoffeeType.Latte:
        return Latte();
      default:
        throw Exception('Неподдерживаемый тип кофе');
    }
  }
}