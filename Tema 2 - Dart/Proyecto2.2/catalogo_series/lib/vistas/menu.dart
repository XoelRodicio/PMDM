import 'dart:io';

import '../modelo/criterios.dart';
import '../modelo/repositorio_series.dart';
import '../modelo/serie.dart';
import 'lector.dart';

class Menu {
  final RepositorioSeries repositorio;
  bool ejemplosCargados = false;

  Menu({required this.repositorio});

  void iniciar() {
    String opcion = '';

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
            cargarEjemplos();
          case '2':
            anadir();
          case '3':
            modificar();
          case '4':
            eliminar();
          case '5':
            listar();
          case '6':
            buscar();
          case '7':
            print("Saliendo");
          default:
            print("Opción no válida");
        }
    } while (opcion != '7');
  }

  // MENU

  void cargarEjemplos() {
    if (ejemplosCargados) {
      print('Los ejemplos ya están cargados');
      return;
    }

    final c = repositorio.siguienteCodigo();

    repositorio.agregarVarios([
      SerieNormal(
        codigo: c,
        titulo: 'Breaking Bad',
        genero: Genero.crimen,
        ano: 2008,
        valoracion: 9.5,
        plataformas: [plataformasDisponibles[0]],
        temporadas: 5,
      ),
      SerieNormal(
        codigo: c + 1,
        titulo: 'Prison Break',
        genero: Genero.accion,
        ano: 2005,
        valoracion: 8.3,
        plataformas: [plataformasDisponibles[2]],
        temporadas: 5,
      ),
      SerieNormal(
        codigo: c + 2,
        titulo: 'Rick y Morty',
        genero: Genero.cienciaFiccion,
        ano: 2013,
        valoracion: 8.9,
        plataformas: [plataformasDisponibles[0]],
        temporadas: 7,
      ),
      SerieNormal(
        codigo: c + 3,
        titulo: 'Reacher',
        genero: Genero.thriller,
        ano: 2022,
        valoracion: 7.8,
        plataformas: [plataformasDisponibles[3]],
        temporadas: 3,
      ),
      SerieNormal(
        codigo: c + 4,
        titulo: 'Black Mirror',
        genero: Genero.cienciaFiccion,
        ano: 2011,
        valoracion: 8.7,
        plataformas: [
          plataformasDisponibles[0],
          plataformasDisponibles[3],
        ],
        temporadas: 6,
      ),
    ]);

    ejemplosCargados = true;
    print('Series cargadas correctamente');
  }

  void anadir() {
    print('\nAñadir');

    final datos = pedirDatos();
    final codigo = repositorio.siguienteCodigo();

    final nueva = SerieNormal(
      codigo: codigo,
      titulo: datos.titulo,
      genero: datos.genero,
      ano: datos.ano,
      valoracion: datos.valoracion,
      plataformas: datos.plataformas,
      temporadas: datos.temporadas,
    );

    if (repositorio.agregar(nueva)) {
      print('Serie añadida:\n$nueva');
    } else {
      print('No se puede añadir, código existente');
    }
  }

  void modificar() {
    print('\nModificar');

    final serie = elegirSerie();
    if (serie == null) {
      return;
    }

    print('Escribe los datos nuevos:');

    final datos = pedirDatos();

    serie.titulo = datos.titulo;
    serie.genero = datos.genero;
    serie.ano = datos.ano;
    serie.valoracion = datos.valoracion;

    serie.plataformas.clear();
    serie.plataformas.addAll(datos.plataformas);

    if (serie is SerieNormal) {
      serie.temporadas = datos.temporadas;
    }

    print('Serie modificada:\n$serie');
  }

  void eliminar() {
    print('\nEliminar');

    final serie = elegirSerie();
    if (serie == null) {
      return;
    }

    print('¿Seguro que quieres eliminar "${serie.titulo}"? (s/n)');
    final seguro = Lector.confirmar();

    if (!seguro) {
      print('Eliminación cancelada');
      return;
    }

    final eliminada = repositorio.eliminar(serie.codigo);
    print(eliminada ? 'Serie eliminada' : 'No se encontró la serie');
  }

  void listar() {
    print('\nListar');

    if (repositorio.estaVacio) {
      print('No hay series');
      return;
    }

    mostrarLista(repositorio.consultar());
  }

  void buscar() {
    print('\nBuscar');
    print('Título o género a buscar:');
    final texto = Lector.leerTexto();

    final resultado = repositorio.consultar(
      condicion: filtroPorTexto(texto),
      comparador: comparadorPorTitulo(),
    );

    if (resultado.isEmpty) {
      print('No se ha encontrado ninguna serie con "$texto"');
      return;
    }

    mostrarLista(resultado);
  }

  void mostrarLista(List<Serie> series) {
    for (var i = 0; i < series.length; i++) {
      print(series[i]);
      final quedanMas = i < series.length - 1;
      if ((i + 1) % 5 == 0 && quedanMas) {
        Lector.pausa();
      }
    }
  }

  Serie? elegirSerie() {
    if (repositorio.estaVacio) {
      print('No hay series');
      return null;
    }

    mostrarLista(repositorio.consultar());

    print('Código de la serie (0 para cancelar):');
    final codigo = Lector.leerEntero(minimo: 0, maximo: 999999);

    if (codigo == 0) {
      print('Cancelado');
      return null;
    }

    final serie = repositorio.buscarPorCodigo(codigo);

    if (serie == null) {
      print('No existe esa serie');
      return null;
    }

    return serie;
  }

  ({
    String titulo,
    Genero genero,
    int ano,
    double valoracion,
    List<Plataforma> plataformas,
    int temporadas
  }) pedirDatos() {
    print('Título:');
    final titulo = Lector.leerTexto();

    print('Géneros:');
    for (int i = 0; i < Genero.values.length; i++) {
      print('${i + 1}. ${Genero.values[i].texto}');
    }
    print('Género:');
    final numeroGenero = Lector.leerEntero(
      minimo: 1,
      maximo: Genero.values.length,
    );

    print('Año (1900-2026):');
    final ano = Lector.leerEntero(minimo: 1900, maximo: 2026);

    print('Valoración (0-10):');
    final valoracion = Lector.leerDecimal(minimo: 0, maximo: 10);

    print('Plataformas:');
    for (int i = 0; i < plataformasDisponibles.length; i++) {
      print('${i + 1}. ${plataformasDisponibles[i].nombre}');
    }
    print('Número de plataforma:');
    final numeroPlataforma = Lector.leerEntero(
      minimo: 1,
      maximo: plataformasDisponibles.length,
    );

    print('Temporadas (1-50):');
    final temporadas = Lector.leerEntero(minimo: 1, maximo: 50);

    return (
      titulo: titulo,
      genero: Genero.values[numeroGenero - 1],
      ano: ano,
      valoracion: valoracion,
      plataformas: [plataformasDisponibles[numeroPlataforma - 1]],
      temporadas: temporadas,
    );
  }
}
