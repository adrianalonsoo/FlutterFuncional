// ignore_for_file: avoid_unnecessary_containers, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: imc(),
    );
  }
}

class imc extends StatefulWidget {
  const imc({Key? key}) : super(key: key);

  @override
  State<imc> createState() => _imcState();
}

class _imcState extends State<imc> {
  int currentindex = 0;
  String resultado = "";

  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora IMC",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  radioButton("Hombre", Colors.blue, 0),
                  radioButton("Mujer", Colors.pink, 1)
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Altura en Cm: ",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: alturaController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Tu altura en Cm",
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Peso en Kg: ",
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: pesoController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Tu Peso en Kg",
                    filled: true,
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 60.0,
                child: TextButton(
                  child: Text("Calcular"),
                  onPressed: () {
                    double altura = double.parse(alturaController.value.text);
                    double peso = double.parse(pesoController.value.text);
                    calcularImc(altura, peso);
                  },
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "Tu IMC es de: ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: double.infinity,
                child: Text(
                  "$resultado",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  String calcularImc(double altura, double peso) {
    double finalresultado = peso / (altura * altura / 10000);
    String imc = finalresultado.toStringAsFixed(2);
    setState(() {
      resultado = imc;
    });
    return resultado;
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      height: 80.0,
      child: TextButton(
        onPressed: () {
          changeIndex(index);
        },
        child: Text(
          value,
          style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
