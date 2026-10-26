import 'dart:io';

// Géneros que se pueden seleccionar para una serie.
enum Genero {
  crimen,
  accion,
  cienciaFiccion,
  thriller,
  distopia,
  drama,
  comedia,
  aventura
}

// Devuelve el nombre legible de cada género.
extension NombreGenero on Genero {
  String get nombre {
    switch (this) {
      case Genero.crimen:
        return 'Crimen';
      case Genero.accion:
        return 'Acción';
      case Genero.cienciaFiccion:
        return 'Ciencia ficción';
      case Genero.thriller:
        return 'Thriller';
      case Genero.distopia:
        return 'Distopía';
      case Genero.drama:
        return 'Drama';
      case Genero.comedia:
        return 'Comedia';
      case Genero.aventura:
        return 'Aventura';
    }
  }
}

// Interfaz para los objetos que se pueden mostrar en pantalla.
abstract class Presentable {
  String presentar();
}

// Representa una plataforma, por ejemplo Netflix o Prime Video.
class Plataforma {
  final String codigo;
  String _nombre;

  Plataforma({required this.codigo, required String nombre})
      : _nombre = nombre.trim() {
    if (codigo.isEmpty || _nombre.isEmpty) {
      throw ArgumentError('El código y el nombre son obligatorios.');
    }
  }

  String get nombre => _nombre;

  set nombre(String valor) {
    if (valor.trim().isEmpty) {
      throw ArgumentError('El nombre no puede estar vacío.');
    }
    _nombre = valor.trim();
  }

  @override
  String toString() => nombre;
}

// Clase base abstracta con los datos comunes del contenido digital.
abstract class ContenidoDigital {
  final int codigo;
  String _titulo;
  Genero _genero;
  int _ano;
  List<Plataforma> _plataformas;
  double _valoracion;

  ContenidoDigital({
    required this.codigo,
    required String titulo,
    required Genero genero,
    required int ano,
    required List<Plataforma> plataformas,
    required double valoracion,
  })  : _titulo = titulo.trim(),
        _genero = genero,
        _ano = ano,
        _plataformas = List.from(plataformas),
        _valoracion = valoracion {
    if (codigo < 1) throw ArgumentError('El código debe ser positivo.');
    if (_titulo.isEmpty) throw ArgumentError('El título no puede estar vacío.');
    if (ano < 1900 || ano > DateTime.now().year) {
      throw ArgumentError('El año no es válido.');
    }
    if (_plataformas.isEmpty) {
      throw ArgumentError('Debe indicar al menos una plataforma.');
    }
    if (valoracion < 0 || valoracion > 10) {
      throw ArgumentError('La valoración debe estar entre 0 y 10.');
    }
  }

  String get titulo => _titulo;
  Genero get genero => _genero;
  int get ano => _ano;
  List<Plataforma> get plataformas => List.unmodifiable(_plataformas);
  double get valoracion => _valoracion;

  set titulo(String valor) {
    if (valor.trim().isEmpty) throw ArgumentError('El título no puede estar vacío.');
    _titulo = valor.trim();
  }

  set genero(Genero valor) => _genero = valor;

  set ano(int valor) {
    if (valor < 1900 || valor > DateTime.now().year) {
      throw ArgumentError('El año no es válido.');
    }
    _ano = valor;
  }

  set plataformas(List<Plataforma> valor) {
    if (valor.isEmpty) throw ArgumentError('Debe indicar una plataforma.');
    _plataformas = List.from(valor);
  }

  set valoracion(double valor) {
    if (valor < 0 || valor > 10) {
      throw ArgumentError('La valoración debe estar entre 0 y 10.');
    }
    _valoracion = valor;
  }

  String descripcion();
}

// Clase Serie: cada objeto representa una serie concreta.
class Serie extends ContenidoDigital implements Presentable {
  Serie({
    required super.codigo,
    required super.titulo,
    required super.genero,
    required super.ano,
    required super.plataformas,
    required super.valoracion,
  });

  @override
  String descripcion() => 'Serie';

  @override
  String presentar() {
    String nombres = plataformas.map((p) => p.nombre).join(', ');
    return 'Código: $codigo | $titulo | ${genero.nombre} | Año: $ano | '
        'Plataformas: $nombres | Valoración: $valoracion | ${descripcion()}';
  }

  @override
  String toString() => presentar();
}

// Subclase que demuestra herencia y polimorfismo.
class SerieDocumental extends Serie {
  SerieDocumental({
    required super.codigo,
    required super.titulo,
    required super.genero,
    required super.ano,
    required super.plataformas,
    required super.valoracion,
  });

  @override
  String descripcion() => 'Serie documental';
}

// El repositorio guarda y gestiona las series. No usa teclado ni imprime.
class RepositorioSeries {
  final List<Serie> _series = [];

  bool get isEmpty => _series.isEmpty;
  List<Serie> get todas => List.unmodifiable(_series);

  int siguienteCodigo() {
    int mayor = 0;
    for (final serie in _series) {
      if (serie.codigo > mayor) mayor = serie.codigo;
    }
    return mayor + 1;
  }

  Serie? buscarPorCodigo({required int codigo}) {
    for (final serie in _series) {
      if (serie.codigo == codigo) return serie;
    }
    return null;
  }

  bool anadir({required Serie serie}) {
    if (buscarPorCodigo(codigo: serie.codigo) != null) return false;
    _series.add(serie);
    return true;
  }

  void anadirVarias({required List<Serie> series}) {
    _series.addAll(series.where(
      (nueva) => buscarPorCodigo(codigo: nueva.codigo) == null,
    ));
  }

  bool eliminar({required int codigo}) {
    final serie = buscarPorCodigo(codigo: codigo);
    if (serie == null) return false;
    return _series.remove(serie);
  }

  bool modificar({required int codigo, required Serie nueva}) {
    int posicion = _series.indexWhere((serie) => serie.codigo == codigo);
    if (posicion == -1 || nueva.codigo != codigo) return false;
    _series[posicion] = nueva;
    return true;
  }

  // El callback permite pasar el criterio que se quiera buscar.
  List<Serie> buscarConCriterio({required bool Function(Serie) criterio}) {
    return _series.where(criterio).toList();
  }

  List<Serie> ordenarPorTitulo() {
    List<Serie> resultado = List.from(_series);
    resultado.sort((a, b) =>
        a.titulo.toLowerCase().compareTo(b.titulo.toLowerCase()));
    return resultado;
  }

  List<Serie> filtrarPorValoracion({required double minima}) {
    return _series.where((serie) => serie.valoracion >= minima).toList();
  }

  // Añade ejemplos sin repetir los códigos que ya existan.
  void cargarEjemplos() {
    anadirVarias(series: [
      Serie(codigo: 1, titulo: 'Breaking Bad', genero: Genero.crimen,
          ano: 2008, plataformas: [
            Plataforma(codigo: 'netflix', nombre: 'Netflix')
          ], valoracion: 9.5),
      Serie(codigo: 2, titulo: 'Prison Break', genero: Genero.accion,
          ano: 2005, plataformas: [
            Plataforma(codigo: 'disney', nombre: 'Disney+')
          ], valoracion: 8.3),
      Serie(codigo: 3, titulo: 'Rick y Morty', genero: Genero.cienciaFiccion,
          ano: 2013, plataformas: [
            Plataforma(codigo: 'netflix', nombre: 'Netflix')
          ], valoracion: 8.9),
      Serie(codigo: 4, titulo: 'Reacher', genero: Genero.thriller,
          ano: 2022, plataformas: [
            Plataforma(codigo: 'prime', nombre: 'Prime Video')
          ], valoracion: 7.8),
      SerieDocumental(codigo: 5, titulo: 'Black Mirror', genero: Genero.distopia,
          ano: 2011, plataformas: [
            Plataforma(codigo: 'netflix', nombre: 'Netflix')
          ], valoracion: 8.7),
    ]);
  }
}

// La clase Menu se encarga de hablar con la persona usuaria.
class Menu {
  final RepositorioSeries repositorio;

  Menu(this.repositorio);

  void iniciar() {
    String opcion = '';
    while (opcion != '7') {
      print('\\n-------------------------------');
      print('  MENÚ DE SERIES');
      print('  1- CARGAR DATOS DE EJEMPLO');
      print('  2- AÑADIR');
      print('  3- MODIFICAR');
      print('  4- ELIMINAR');
      print('  5- LISTAR');
      print('  6- BUSCAR');
      print('  7- SALIR');
      print('-------------------------------');
      stdout.write('Elige una opción: ');
      opcion = stdin.readLineSync() ?? '';

      switch (opcion) {
        case '1':
          repositorio.cargarEjemplos();
          print('Datos de ejemplo cargados sin duplicar los existentes.');
          break;
        case '2':
          anadirSerie();
          break;
        case '3':
          modificarSerie();
          break;
        case '4':
          eliminarSerie();
          break;
        case '5':
          listarSeries();
          break;
        case '6':
          buscarSeries();
          break;
        case '7':
          print('Saliendo del programa.');
          break;
        default:
          print('Opción no válida.');
      }
    }
  }

  // Lee un texto obligatorio.
  String leerTexto({required String pregunta}) {
    String texto = '';
    while (texto.isEmpty) {
      stdout.write(pregunta);
      texto = (stdin.readLineSync() ?? '').trim();
      if (texto.isEmpty) print('El texto no puede estar vacío.');
    }
    return texto;
  }

  // Lee un número entero dentro de un rango.
  int leerEntero({
    required String pregunta,
    required int minimo,
    required int maximo,
  }) {
    while (true) {
      stdout.write(pregunta);
      int? numero = int.tryParse(stdin.readLineSync() ?? '');
      if (numero != null && numero >= minimo && numero <= maximo) {
        return numero;
      }
      print('Introduce un número entre $minimo y $maximo.');
    }
  }

  // Lee una valoración válida.
  double leerDecimal({required String pregunta}) {
    while (true) {
      stdout.write(pregunta);
      String texto = (stdin.readLineSync() ?? '').replaceAll(',', '.');
      double? numero = double.tryParse(texto);
      if (numero != null && numero >= 0 && numero <= 10) return numero;
      print('La valoración debe estar entre 0 y 10.');
    }
  }

  Genero leerGenero() {
    while (true) {
      print('Géneros: ${Genero.values.map((g) => g.name).join(', ')}');
      String texto = leerTexto(pregunta: 'Género: ').toLowerCase();
      for (final genero in Genero.values) {
        if (genero.name.toLowerCase() == texto ||
            genero.nombre.toLowerCase() == texto) {
          return genero;
        }
      }
      print('Ese género no está disponible.');
    }
  }

  List<Plataforma> leerPlataformas() {
    String texto = leerTexto(
      pregunta: 'Plataforma(s), separadas por comas si hay varias: ',
    );
    List<String> nombres = texto
        .split(',')
        .map((nombre) => nombre.trim())
        .where((nombre) => nombre.isNotEmpty)
        .toSet()
        .toList();

    return nombres.map((nombre) => Plataforma(
      codigo: nombre.toLowerCase().replaceAll(' ', '_'),
      nombre: nombre,
    )).toList();
  }

  // Pide los campos que se usan tanto al añadir como al modificar.
  Serie pedirDatos({required int codigo}) {
    String titulo = leerTexto(pregunta: 'Título: ');
    Genero genero = leerGenero();
    int ano = leerEntero(
      pregunta: 'Año: ',
      minimo: 1900,
      maximo: DateTime.now().year,
    );
    List<Plataforma> plataformas = leerPlataformas();
    double valoracion = leerDecimal(pregunta: 'Valoración (0-10): ');

    return Serie(
      codigo: codigo,
      titulo: titulo,
      genero: genero,
      ano: ano,
      plataformas: plataformas,
      valoracion: valoracion,
    );
  }

  void anadirSerie() {
    try {
      Serie nueva = pedirDatos(codigo: repositorio.siguienteCodigo());
      print(repositorio.anadir(serie: nueva)
          ? 'Serie añadida correctamente.'
          : 'Ya existe una serie con ese código.');
    } on ArgumentError catch (error) {
      print('No se pudo añadir la serie: $error');
    }
  }

  void listarSeries() {
    if (repositorio.isEmpty) {
      print('No hay series.');
      return;
    }
    mostrarListado(repositorio.ordenarPorTitulo());
  }

  void modificarSerie() {
    if (repositorio.isEmpty) {
      print('No hay series para modificar.');
      return;
    }
    mostrarListado(repositorio.todas);
    int codigo = leerEntero(
      pregunta: 'Código a modificar (0 para cancelar): ',
      minimo: 0,
      maximo: 999999,
    );
    if (codigo == 0) {
      print('Modificación cancelada.');
      return;
    }
    if (repositorio.buscarPorCodigo(codigo: codigo) == null) {
      print('No existe una serie con ese código.');
      return;
    }

    try {
      Serie nueva = pedirDatos(codigo: codigo);
      print(repositorio.modificar(codigo: codigo, nueva: nueva)
          ? 'Serie modificada correctamente.'
          : 'No se pudo modificar la serie.');
    } on ArgumentError catch (error) {
      print('No se pudo modificar la serie: $error');
    }
  }

  void eliminarSerie() {
    if (repositorio.isEmpty) {
      print('No hay series para eliminar.');
      return;
    }
    mostrarListado(repositorio.todas);
    int codigo = leerEntero(
      pregunta: 'Código a eliminar (0 para cancelar): ',
      minimo: 0,
      maximo: 999999,
    );
    if (codigo == 0) {
      print('Eliminación cancelada.');
      return;
    }
    if (repositorio.buscarPorCodigo(codigo: codigo) == null) {
      print('No existe una serie con ese código.');
      return;
    }

    stdout.write('¿Seguro que quieres eliminarla? (s/n): ');
    String confirmar = (stdin.readLineSync() ?? '').trim().toLowerCase();
    if (confirmar == 's' || confirmar == 'si' || confirmar == 'sí') {
      print(repositorio.eliminar(codigo: codigo)
          ? 'Serie eliminada.'
          : 'No se pudo eliminar la serie.');
    } else {
      print('Eliminación cancelada.');
    }
  }

  void buscarSeries() {
    if (repositorio.isEmpty) {
      print('No hay series para buscar.');
      return;
    }
    String texto = leerTexto(
      pregunta: 'Busca por título, género o plataforma: ',
    ).toLowerCase();

    List<Serie> resultados = repositorio.buscarConCriterio(
      criterio: (serie) =>
          serie.titulo.toLowerCase().contains(texto) ||
          serie.genero.nombre.toLowerCase().contains(texto) ||
          serie.plataformas.any(
            (plataforma) => plataforma.nombre.toLowerCase().contains(texto),
          ),
    );

    if (resultados.isEmpty) {
      print('No se encontraron series.');
    } else {
      mostrarListado(resultados);
    }
  }

  // Se usa tanto para listar como para mostrar resultados de búsqueda.
  void mostrarListado(List<Serie> series) {
    const int porPagina = 3;
    for (int i = 0; i < series.length; i++) {
      print(series[i].presentar());
      if ((i + 1) % porPagina == 0 && i + 1 < series.length) {
        stdout.write('Pulsa Enter para ver más...');
        stdin.readLineSync();
      }
    }
  }
}

void main() {
  final repositorio = RepositorioSeries();
  final menu = Menu(repositorio);
  menu.iniciar();
}
