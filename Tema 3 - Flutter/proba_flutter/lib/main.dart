// import 'package:flutter/material.dart';

// final tema = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber));

// final temaClaro = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber), brightness: Brightness.light);
// final temaOsucro = ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber), brightness: Brightness.dark);

// void main() {
//   runApp(MiAplicacion());
// }

// void saludar() {
//   print("shalom shabat");
// }

// class MiAplicacion extends StatelessWidget {
//   const MiAplicacion({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "App de Exemplo",
//       home: PantallaPrincipal(),
//       theme: temaClaro,
//       darkTheme: temaOsucro,
//       themeMode: ThemeMode.system,
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class PantallaPrincipal extends StatelessWidget {
//   const PantallaPrincipal({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final tema = Theme.of(context);
//     var alumnos = ["Xurxo", "Anxo", "Xoel", "Iria", "David", "Verificatis"];
//     return Scaffold(
//       body: GridView.count(crossAxisCount: 3, children: [for(final nome in alumnos) Card(child: Text(nome),)],)
//       GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context, index) => Card(child: Center(child: Text(alumnos[index]),),),)
//         Column(
//           children: [
//             Text("Inshalah", style: tema.textTheme.titleLarge,),
//             SizedBox(height: 16),
//             FilledButton(onPressed: () => print("Nigga pulsa"), child: Text("Shalom")),
//             SizedBox(height: 16),
//             ElevatedButton(onPressed: () => print("Nigga pulsa 2"), child: Text("Shabat"))
//           ],
//         )
//         // GridView.builder(
//         //   itemCount: alumnos.length,
//         //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         //   itemBuilder: (contexto, indice) => Card(child: Text(alumnos[indice]))
//         //   )
//         // GridView.count(crossAxisCount: 3,
//         // children: [
//         //   for (final nome in alumnos)
//         //     Card(child: Text(nome),
//         //     )
//         // ],
//         // )
//     );
//   }


//       // body:
//         // ListView(
//         //   children: [
//         //     ListTile(
//         //       leading: Icon(Icons.vaping_rooms),
//         //       title: Text("Smoke"),
//         //       subtitle: Text("IES SAN NIGGER"),
//         //       trailing: Icon(Icons.chevron_right)
//         //     ),
//         //     ListTile(
//         //       leading: Icon(Icons.transgender_outlined),
//         //       title: Text("Smoke"),
//         //       subtitle: Text("IES SAN NIGGER") 
//         //     ),
//         //     ListTile(
//         //       leading: Icon(Icons.paid_outlined),
//         //       title: Text("Smoke"),
//         //       subtitle: Text("IES SAN NIGGER") 
//         //     )
//         //   ],
//         // )
//       // body: Container(
//       //   width: 250.0,
//       //   height: 120.0,
//       //   margin: EdgeInsets.all(8.0),
//       //   padding: EdgeInsets.all(16),
//       //   color: Colors.blue,
//       //   child: Text("nigger"),
//       // )
      
//     // return Scaffold(
//     //   body: Row(
//     //     mainAxisAlignment: MainAxisAlignment.center,
//     //     children: [
//     //       Text("Hola"),
//     //       SizedBox(width: 30.0),
//     //       Text("Adios"),
//     //       SizedBox(width: 30.0),
//     //       Text("Puta Barça puta Cataluña"),
//     //       SizedBox(width: 30.0)
//     //     ],),
//     // );
//     // return Scaffold(
//     //   body: Column(
//     //     children: [
//     //       Image.asset("assets/img/descarga.jpeg",
//     //       width: 150.0,
//     //       height: 150.0
//     //       ),
//     //       SizedBox(height: 20.0),
//     //       Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTQFLyKRjtuEV9oPWvL-X6p663zTZ1VZR2MXiZge01kQ&s=10",
//     //       errorBuilder: (context, error, stackTrace) {
//     //         return Text("Non se pudo cargar a imaxe");
//     //       }
//     //       ),
           
//     //     ],
//     //   ),
//     // );
//   }


// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           ListTile(
//             leading: Icon(Icons.school),
//             title: Text("Hola"),
//             subtitle: Text("Hola"),
//           ),
//           ListTile(
//             leading: Icon(Icons.school),
//             title: Text("Hola"),
//             subtitle: Text("Hola"),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class AMinaImaxeLocal extends StatelessWidget {
// //   const new({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Image.asset("assets/img/unnamed.jpg");
// //   }
// // }

// // class OMeuIcono extends StatelessWidget {
// //   const new({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Icon(Icons.favorite, 
// //     size: 80.0, 
// //     color: Colors.amber, 
// //     semanticLabel: "Icono favorito");
// //   }
// // }
// class OMeuTexto extends StatelessWidget {
//   final Color? corFondo;
//   final String texto;

//   const OMeuTexto({
//     this.corFondo,
//     required this.texto,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(this.texto, 
//       textAlign: TextAlign.center,
//       maxLines: 2,
//       overflow: TextOverflow.fade,
//       style: TextStyle(
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold,
//         color: Colors.deepPurpleAccent,
//         letterSpacing: 10.0,
//         height: 20,
//         decoration: TextDecoration.lineThrough),
//         );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Image.asset(
//             "src/assest/img"),
//             SizedBox(height: 16,),
//             Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTQFLyKRjtuEV9oPWvL-X6p663zTZ1VZR2MXiZge01kQ&s=10",
//             errorBuilder: (context, error, stackTrace) {
//             return Text("Non se pudo cargar a imaxe");
//           })
//         ],
//       ),
//     )
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: PantallaAlumnado(),
//     );
//   }
// }

// class PantallaAlumnado extends StatelessWidget {
//   const PantallaAlumnado({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var alumnado = [
//       'Xurxo',
//       'Roi',
//       'Iria',
//       'Anxo',
//       'Adrián',
//       'Iago',
//       'Sergio',
//       'Xoel',
//     ];

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20.0),
//               color: Colors.blueAccent,
//               child: const Text(
//                 'Alumnado de 2º DAM',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: alumnado.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Card(
//                     margin: const EdgeInsets.symmetric(
//                       horizontal: 16.0,
//                       vertical: 8.0,
//                     ),
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         child: Text(alumnado[index][0]),
//                       ),
//                       title: Text(
//                         alumnado[index],
//                         style: const TextStyle(fontSize: 18),
//                       ),
//                       subtitle: Text('Posto na lista: ${index + 1}'),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
