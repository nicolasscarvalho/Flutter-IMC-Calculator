import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter IMC Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();

  String imcResultado = '00.00';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
        centerTitle: true,

      ),
      body: Center(
        
        child: Padding (
          padding: const EdgeInsets.all(16),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const Text(
                'O índice de massa corporal é uma medida internacional usada para calcular se uma pessoa está no peso ideal. Confira já o seu: ',
                textAlign: TextAlign.justify,
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: controllerPeso,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  hintText: 'Digite seu peso:',
                  border: OutlineInputBorder (borderRadius: BorderRadius.all(Radius.circular(16)))
                ),
              ),


              const SizedBox(height: 16),


              TextFormField(
                controller: controllerAltura,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  hintText: 'Digite sua altura:',
                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16)))
                ),
              ),


              const SizedBox(height: 16),


              Text(
                'Resultado: $imcResultado',
                style: const TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),


              const SizedBox(height: 16),


              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade300,
                    foregroundColor: Colors.white 
                  ),
                  onPressed: () {
                    setState(() {
                      imcResultado = (num.parse(controllerPeso.text) / ( num.parse(controllerAltura.text) * num.parse(controllerAltura.text) )).toStringAsFixed(2);
                    });
                  }, 
                  child: const Text('Calcular')
                ),
              ),


            ],
          )
        )
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            imcResultado = '00.00';
          });
        },
        tooltip: 'Limpar resultado',
        child: const Text('Limpar')
      ),


    );
  }
}
