enum Genero {
  accion('Acción'),
  comedia('Comedia'),
  cienciaFiccion('Ciencia ficción'),
  crimen('Crimen'),
  drama('Drama'),
  thriller('Thriller');

  final String texto; 
  const Genero(this.texto);
}

class Plataforma {
  final int codigo;
  final String nombre;

  const Plataforma({required this.codigo, required this.nombre});
}

const List<Plataforma> plataformasDisponibles = [
  Plataforma(codigo: 1, nombre: 'Netflix'),
  Plataforma(codigo: 2, nombre: 'HBO Max'),
  Plataforma(codigo: 3, nombre: 'Disney+'),
  Plataforma(codigo: 4, nombre: 'Prime Video'),
];


abstract class Serie {
  final int codigo; 
  late String _titulo;
  late int _ano;
  late double _valoracion;
  Genero genero;
  final List<Plataforma> plataformas;

  Serie({
    required this.codigo,
    required String titulo,
    required this.genero,
    required int ano,
    required double valoracion,
    required this.plataformas,
  }) {

    this.titulo = titulo;
    this.ano = ano;
    this.valoracion = valoracion;
    if (plataformas.isEmpty) {
      throw ArgumentError('La serie debe estar en alguna plataforma');
    }
  }

  String get titulo => _titulo;
  set titulo(String valor) {
    if (valor.trim().isEmpty) {
      throw ArgumentError('El título no puede estar vacío');
    }
    _titulo = valor.trim();
  }

  int get ano => _ano;
  set ano(int valor) {
    if (valor < 1900 || valor > 2026) {
      throw ArgumentError('El año debe estar entre 1900 y 2026');
    }
    _ano = valor;
  }

  double get valoracion => _valoracion;
  set valoracion(double valor) {
    if (valor < 0 || valor > 10) {
      throw ArgumentError('La valoración debe estar entre 0 y 10');
    }
    _valoracion = valor;
  }

  String descripcion();

  @override
  String toString() {
    final nombres = plataformas.map((p) => p.nombre).join(', ');
    return '[$codigo] $_titulo ($_ano) - ${genero.texto} - $_valoracion/10\n' '${descripcion()} | Plataformas: $nombres';
  }
}

class SerieNormal extends Serie {
  late int _temporadas;

  SerieNormal({
    required super.codigo,
    required super.titulo,
    required super.genero,
    required super.ano,
    required super.valoracion,
    required super.plataformas,
    required int temporadas,
  }) {
    this.temporadas = temporadas;
  }

  int get temporadas => _temporadas;

  set temporadas(int valor) {
    if (valor < 1 || valor > 50) {
      throw ArgumentError('Las temporadas deben estar entre 1 y 50');
    }
    _temporadas = valor;
  }

  @override
  String descripcion() => 'Serie de $_temporadas temporadas';
}
