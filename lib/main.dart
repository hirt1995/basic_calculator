import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

enum Operacion {sumar, restar, multiplicar, dividir}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _total = 0;
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();

  void _calcular(Enum operacion) {
    setState(() {
      switch(operacion){
        case Operacion.sumar:
          _total = int.parse(_numero1.text) + int.parse(_numero2.text);
          break;
        case Operacion.restar:
          _total = int.parse(_numero1.text) - int.parse(_numero2.text);
          break;
        case Operacion.multiplicar:
          _total = int.parse(_numero1.text) * int.parse(_numero2.text);
          break;
        case Operacion.dividir:
          _total = (int.parse(_numero1.text) ~/ int.parse(_numero2.text));
          break;
      }


    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(

        child: Column(

          children: <Widget>[
            TextFormField(
              controller: _numero1,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Digite el primer número'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              controller: _numero2,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Digite el segundo número'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
            ElevatedButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize:20)
              ),
              onPressed: () {
                _calcular(Operacion.sumar);
              },
              child: const Text("+"),
            ),
            const SizedBox(
              width: 16.0,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize:20)
              ),
              onPressed: () {
                _calcular(Operacion.restar);
              },
              child: const Text("-"),
            ),
            const SizedBox(
              width: 16.0,
            ),

            ElevatedButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize:20)
              ),
              onPressed: () {
                _calcular(Operacion.multiplicar);
              },
              child: const Text("*"),
            ),
            const SizedBox(
              width: 16.0,
            ),

            ElevatedButton(
              style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize:20)
              ),
              onPressed: () {
                _calcular(Operacion.dividir);
              },
              child: const Text("/"),
            ),
          ],),
            const SizedBox(
              width: 16.0,
            ),


            Text(
              'El total es $_total',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
     // floatingActionButton: FloatingActionButton(
       // onPressed: _incrementCounter,
        //tooltip: 'Increment',
        //child: const Icon(Icons.add),
      //), // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
