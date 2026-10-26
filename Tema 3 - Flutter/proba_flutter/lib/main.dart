import 'package:flutter/material.dart';

void main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App de Exemplo",
      home: PantallaPrincipal(),
    );
  }
}

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Titulo barra"),),
      body: Row(
        children: [
          Column(
            children: [
              Text("Hola"),
            ],
          ),
        ],
      ) 
    );
  }
}
