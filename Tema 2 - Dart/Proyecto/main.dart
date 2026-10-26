import 'dart:io';

List<({
  String titulo,
  String genero,
  int ano,
  String plataforma,
  double valoracion
})> series = [];

void main() {
  menu();
}

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

void cargarDatosEjemplo() {
  series.add((titulo: "Breaking Bad", genero: "Crimen", ano: 2008, plataforma: "Netflix", valoracion: 9.5));
  series.add((titulo: "Prison Break", genero: "Accion", ano: 2005, plataforma: "Disney+", valoracion: 8.3));
  series.add((titulo: "Rick y Morty", genero: "Ciencia Ficcion", ano: 2013, plataforma: "Netflix", valoracion: 8.9));
  series.add((titulo: "Reacher", genero: "Thriller", ano: 2022, plataforma: "Prime Video", valoracion: 7.8));
  series.add((titulo: "Black Mirror", genero: "Distopía", ano: 2011, plataforma: "Netflix", valoracion: 8.7));

  print("Series cargadas correctamente");
}

void anhadirSerie() {
  print("Añadiendo nueva serie");

  String titulo = "";
  while (titulo.isEmpty) {
    stdout.write("Introduce el titulo: ");
    titulo = stdin.readLineSync() ?? "";

    if (titulo.isEmpty) {
      print("El titulo no puede estar vacío");
    }
  }

  String genero = "";
  while (genero.isEmpty) {
    stdout.write("Introduce el género: ");
    genero = stdin.readLineSync() ?? "";

    if (genero.isEmpty) {
      print("El género no puede estar vacío");
    }
  }

  int ano = 0;
  while (ano < 1900 || ano > 2026) {
    stdout.write("Introduce el año: ");
    ano = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    if (ano < 1900 || ano > 2026) {
      print("Introduce un año válido entre 1900 y 2026.");
    }
  }

  String plataforma = "";
  while (plataforma.isEmpty) {
    stdout.write("Introduce la plataforma: ");
    plataforma = stdin.readLineSync() ?? "";

    if (plataforma.isEmpty) {
      print("La plataforma no puede estar vacía");
    }
  }

  double valoracion = -1;
  while (valoracion < 0 || valoracion > 10) {
    stdout.write("Introduce la valoración (0-10): ");
    valoracion = double.tryParse(stdin.readLineSync() ?? "") ?? -1;

    if (valoracion < 0 || valoracion > 10) {
      print("La valoración debe ser entre 0 y 10");
    }
  }

  final nueva = (
    titulo: titulo,
    genero: genero,
    ano: ano,
    plataforma: plataforma,
    valoracion: valoracion
  );

  if (series.contains(nueva)) {
    print("Esa serie ya existe");
    return;
  }

  series.add(nueva);
  print("Serie añadida");
}


void listarSeries() {
  print("Listado series");
  if (series.isEmpty) {
    print("No hay series");
    return;
  }

  int contador = 1;

  for (final serie in series) {
    print("Número: $contador");
    print("Título: ${serie.titulo}");
    print("Género: ${serie.genero}");
    print("Año: ${serie.ano}");
    print("Plataforma: ${serie.plataforma}");
    print("Valoración: ${serie.valoracion}");
    contador++;
  }

  print("----------------------------------------------");
}
void modificarSerie() {
  print("Modificando serie");
  if (series.isEmpty) {
    print("No hay series");
    return;
  }

  stdout.write("Introduce el número de la serie que quieres modificar: ");
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  if (numero == null) { 
    print("Número no válido"); 
    return; 
    }
  
  if (numero < 1) { 
    print("Número no válido"); 
    return; 
    }
    
  if (numero > series.length) { 
    print("Número no válido"); 
    return; 
    }

  int numSerie = numero - 1;

  String titulo = "";
  while (titulo.isEmpty) {
    stdout.write("Introduce el nuevo título: ");
    titulo = stdin.readLineSync() ?? "";

    if (titulo.isEmpty) {
      print("El titulo no puede estar vacío");
    }
  }

  String genero = "";
  while (genero.isEmpty) {
    stdout.write("Introduce el nuevo género: ");
    genero = stdin.readLineSync() ?? "";

    if (genero.isEmpty) {
      print("El género no puede estar vacío");
    }
  }

  int ano = 0;
  while (ano < 1900 || ano > 2026) {
    stdout.write("Introduce el nuevo año: ");
    ano = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

    if (ano < 1900 || ano > 2026) {
      print("Introduce un año válido entre 1900 y 2026.");
    }
  }

  String plataforma = "";
  while (plataforma.isEmpty) {
    stdout.write("Introduce la nueva plataforma: ");
    plataforma = stdin.readLineSync() ?? "";

    if (plataforma.isEmpty) {
      print("La plataforma no puede estar vacía");
    }
  }

  double valoracion = -1;
  while (valoracion < 0 || valoracion > 10) {
    stdout.write("Introduce la nueva valoración (0-10): ");
    valoracion = double.tryParse(stdin.readLineSync() ?? "") ?? -1;

    if (valoracion < 0 || valoracion > 10) {
      print("La valoración debe ser entre 0 y 10");
    }
  }

  series[numSerie] = (
    titulo: titulo,
    genero: genero,
    ano: ano,
    plataforma: plataforma,
    valoracion: valoracion
  );

  print("Serie modificada");
}

void eliminarSerie() {
  if (series.isEmpty) {
    print("No hay series para eliminar");
    return;
  }

  listarSeries();

  stdout.write("Introduce el número de la serie que quieres eliminar: ");
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  if (numero == null) { 
    print("Número no válido"); 
    return; 
    }
  
  if (numero < 1) { 
    print("Número no válido"); 
    return; 
    }
    
  if (numero > series.length) { 
    print("Número no válido"); 
    return; 
    }


  final serie = series[numero - 1];
  series.remove(serie);

  print("Serie eliminada");
}

void buscarSerie() {
  if (series.isEmpty) {
    print("No hay series");
    return;
  }

  print("1- Buscar por título");
  print("2- Buscar por género");

  stdout.write("Elige una opción: ");
  String opcion = stdin.readLineSync() ?? '';

  if (opcion == '1') {
    stdout.write("Introduce el título que quieres buscar: ");
    String serieBuscar = (stdin.readLineSync() ?? '').trim().toLowerCase();

    buscarTitulo(serieBuscar);
  } else if (opcion == '2') {
    stdout.write("Introduce el género que quieres buscar: ");
    String serieBuscar = (stdin.readLineSync() ?? '').trim().toLowerCase();

    buscarGenero(serieBuscar);
  } else {
    print("Opción no válida");
  }
}

void buscarTitulo(String serieBuscar) {
  bool encontrado = false;

  for (dynamic serie in series) {
    if (serie.titulo.toLowerCase() == serieBuscar) {
      mostrarDatosSerie(serie);
      encontrado = true; 
    }
  }

  if (encontrado == false) {
    print("No se han encontrado series con ese título");
  }
}

void buscarGenero(String serieBuscar) {
  bool encontrado = false;

  for (dynamic serie in series) {
    if (serie.genero.toLowerCase() == serieBuscar) {
      mostrarDatosSerie(serie);
      encontrado = true;
    }
  }

  if (encontrado == false) {
    print("No se han encontrado series con ese género");
  }
}

void mostrarDatosSerie(dynamic serie) {
  print("----------------------------------------------");
  print("${serie.titulo} - ${serie.genero}");
  print("Año: ${serie.ano}");
  print("Plataforma: ${serie.plataforma}");
  print("Valoración: ${serie.valoracion}");
}
