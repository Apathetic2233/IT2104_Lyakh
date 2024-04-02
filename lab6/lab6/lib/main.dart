import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  int? _width;
  int? _height;

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
            const Text('Высота(мм):', style: TextStyle(fontSize: 20.0)),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) return 'Пожалуйста введите высоту';
              },
              onSaved: (value) {
                _height = int.parse(value!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Вычисление прошло успешно!'),backgroundColor: Colors.green,),);
                }
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  setState(() {});
                }
              },
              child: const Text('Вычислить', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 50.0),
            Center(
              child: Text(
                _width == null || _height == null ? 'Введите значения' : 'S = $_width * $_height = ${_width! * _height!} (мм2)',
                style: TextStyle(fontSize: 30.0),
              ),
            ),
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