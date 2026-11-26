import 'package:material_ui/material_ui.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Fiestra1()
    );
  }
}

class Contador extends StatefulWidget {
  final String titulo;
  final int numero;
  const Contador({required this.titulo, required this.numero, super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int _contador = 0;

  void incrementar() {
    setState(() {
      _contador += widget.numero;
      print("Contador: $_contador");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titulo)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: incrementar,
              child: Text("Sumar ${widget.numero}"),
            ),
          ],
        ),
      ),
    );
  }
}

class Fiestra1 extends StatelessWidget {
  const Fiestra1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fiestra1"),),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => Contador(titulo: "Nigga", numero: 2),));
          }, 
          child: Text("Ir a contador")))
      );
  }
}
