import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  int? _width;
  int? _length;
  String? _formula;

  void _calculateArea() {
    if (_width != null && _length != null) {
      int area = _width! * _length!;
      _formula = 'S=$_width*$_length=$area';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Площадь равна: $area мм2', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Формула расчета площади:', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(_formula!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            const Text('Ширина(мм):', style: TextStyle(fontSize: 20.0)),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) return 'Пожалуйста введите ширину';
              },
              onSaved: (value) {
                _width = int.parse(value!);
              },
            ),
            const SizedBox(height: 20.0),
            const Text('Длина(мм):', style: TextStyle(fontSize: 20.0)),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) return 'Пожалуйста введите длину';
              },
              onSaved: (value) {
                _length = int.parse(value!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _calculateArea();
                }
              },
              child: const Text('Вычислить', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 50.0),
            Text(_width == null || _length == null ? 'Задайте параметры' : 'S = $_width * $_length = ${_width! * _length!} (мм2)', style: TextStyle(fontSize: 30.0)),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Калькулятор площади')),
          body: const MyForm(),
        ),
      ),
    );