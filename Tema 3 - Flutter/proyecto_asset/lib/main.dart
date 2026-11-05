import 'package:flutter/material.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            "assets/img/descarga.jpeg",
            width: 150.0,
            height: 150.0,
          ),
          const SizedBox(height: 20.0),
          Image.network(
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTQFLyKRjtuEV9oPWvL-X6p663zTZ1VZR2MXiZge01kQ&s=10",
            errorBuilder: (context, error, stackTrace) {
              return const Text("Non se pudo cargar a imaxe");
            },
          ),
        ],
      ),
    );
  }
}
