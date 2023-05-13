import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Segunda Tela!!!'),
        ),
        body: Container(child: MyCustomForm()));
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final personName = TextEditingController();
  final personAge = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String age = '';
  bool showWidget = false;

  void getTextInputData() {
    setState(() {
      name = personName.text;
      age = personAge.text;
      showWidget = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: TextFormField(
              controller: personName,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Entre com seu nome',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor entre com seu nome';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: TextFormField(
              controller: personAge,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Entre com sua idade',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor entre com sua idade';
                }
              },
            ),
          ),
          Align(
            alignment: Alignment(0.8, 0.8),
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    getTextInputData();
                  }
                },
                child: const Text('Enviar')),
          ),
          Visibility(
            visible: showWidget,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Oi $name, você tem $age anos de idade!',
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
