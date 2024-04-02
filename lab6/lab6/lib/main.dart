import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
 

  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(10.0),
    child: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
      const Text('Ширина(мм):', style: TextStyle(fontSize: 20.0),),
      TextFormField(validator: (value){
    if (value!.isEmpty) return 'Пожалуйста введите ширину';
      }),
      const SizedBox(height: 20.0),

          const Text('Длину(мм):', style: TextStyle(fontSize: 20.0),),
          TextFormField(validator: (value){
            if (value!.isEmpty) return 'Пожалуйста введите длину';
          }),

          ElevatedButton(onPressed: (){
        if (_formKey.currentState!.validate()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Вычисление прошло успешно!'),backgroundColor: Colors.green,),);
        }
      },
        child: const Text ('Вычислить', style: TextStyle(color: Colors.white),)
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
      appBar: AppBar(title: const Text('Калькулятор площади ')),
      body: const MyForm()
    )
  )
);