enum Genero {
  accion,
  comedia,
  drama,
  cienciaFiccion,
  terror,
  suspense
}

extension GeneroExtension on Genero {
  String get nome {
    switch (this) {
      case Genero.accion: return 'Acción';
      case Genero.comedia: return 'Comedia';
      case Genero.drama: return 'Drama';
      case Genero.cienciaFiccion: return 'Ciencia Ficción';
      case Genero.terror: return 'Terror';
      case Genero.suspense: return 'Suspense';
    }
  }
}
