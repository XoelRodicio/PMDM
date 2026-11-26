import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Imaxes(),      
    );
  }
}

class Imaxes extends StatelessWidget {
  const Imaxes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Galería de 2º DAM"),
      ),
      ),
      body: Column(
        children: [
         Title(color: Colors.black, child: Text("Imaxes do proxecto")),
         Image.asset("assets/img/unnamed.jpg",
         width: 300,
         height: 180,
         fit: BoxFit.cover,),
         Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
         Title(color: Colors.black, child: Text("Imaxes de internet")),
         Image.network("https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
         width: 300,
         height: 180,),
         Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        ]
      )
      
        
    );
  }
}