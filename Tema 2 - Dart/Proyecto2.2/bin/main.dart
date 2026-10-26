import 'dart:io';

void main() {
  void menu() {
  String? opcion = '';

    do {
      print("-------------------------------");
      print("  MENU");
      print("  1- CARGAR DATOS DE EJEMPLO");
      print("  2- AÑADIR");
      print("  3- MODIFICAR");
      print("  4- ELIMINAR");
      print("  5- LISTAR");
      print("  6- BUSCAR");
      print("  7- SALIR");
      print("-------------------------------");

      stdout.write("Elige una opcion: ");
      opcion = stdin.readLineSync() ?? '';

        switch (opcion) {
          case '1':
            cargarDatosEjemplo();
          case '2':
            anhadirSerie();
          case '3':
            modificarSerie();
          case '4':
            eliminarSerie();
          case '5':
            listarSeries();
          case '6':
            buscarSerie();
          case '7':
            print("Saliendo");
          default:
            print("Opción no válida");
        }
    } while (opcion != '7');
  }
}


  
