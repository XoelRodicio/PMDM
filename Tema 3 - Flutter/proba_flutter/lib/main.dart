import 'package:flutter/material.dart';

void main() {
  runApp(MiAplicacion());
}

void saludar() {
  print("shalom shabat");
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
      body: Container(
        width: 250.0,
        height: 120.0,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16),
        color: Colors.blue,
        child: Text("nigger"),
      )
    );
    // return Scaffold(
    //   body: Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text("Hola"),
    //       SizedBox(width: 30.0),
    //       Text("Adios"),
    //       SizedBox(width: 30.0),
    //       Text("Puta Barça puta Cataluña"),
    //       SizedBox(width: 30.0)
    //     ],),
    // );
    // return Scaffold(
    //   body: Column(
    //     children: [
    //       Image.asset("assets/img/descarga.jpeg",
    //       width: 150.0,
    //       height: 150.0
    //       ),
    //       SizedBox(height: 20.0),
    //       Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTQFLyKRjtuEV9oPWvL-X6p663zTZ1VZR2MXiZge01kQ&s=10",
    //       errorBuilder: (context, error, stackTrace) {
    //         return Text("Non se pudo cargar a imaxe");
    //       }
    //       ),
           
    //     ],
    //   ),
    // );
  }
}

class AMinaImaxeLocal extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/img/unnamed.jpg");
  }
}

class OMeuIcono extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.favorite, 
    size: 80.0, 
    color: Colors.amber, 
    semanticLabel: "Icono favorito");
  }
}
class OMeuTexto extends StatelessWidget {
  final Color? corFondo;
  final String texto;

  const OMeuTexto({
    this.corFondo,
    required this.texto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(this.texto, 
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.fade,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.deepPurpleAccent,
        letterSpacing: 10.0,
        height: 20,
        decoration: TextDecoration.lineThrough),
        );
  }
}
