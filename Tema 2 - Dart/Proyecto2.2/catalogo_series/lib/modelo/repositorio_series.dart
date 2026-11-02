import 'serie.dart';

class RepositorioSeries {
  List<Serie> _series = [];
  int _siguienteCodigo = 1;

  bool get estaVacio {
    return _series.isEmpty;
  }

  int siguienteCodigo() {
    return _siguienteCodigo;
  }

  bool agregar(Serie serie) {
    for (Serie s in _series) {
      if (s.codigo == serie.codigo) {
        return false;
      }
    }

    _series.add(serie);
    _siguienteCodigo = serie.codigo + 1;

    return true;
  }

  void agregarVarios(List<Serie> nuevas) {
    for (Serie serie in nuevas) {
      _series.add(serie);
    }

    if (nuevas.isNotEmpty) {
      _siguienteCodigo = nuevas.last.codigo + 1;
    }
  }

  Serie? buscarPorCodigo(int codigo) {
    for (Serie serie in _series) {
      if (serie.codigo == codigo) {
        return serie;
      }
    }

    return null;
  }

  bool eliminar(int codigo) {
    Serie? serie = buscarPorCodigo(codigo);

    if (serie == null) {
      return false;
    }

    _series.remove(serie);
    return true;
  }

  List<Serie> consultar({
    bool Function(Serie)? condicion,
    int Function(Serie, Serie)? comparador,
  }) {
    List<Serie> resultado = [];

    for (Serie serie in _series) {
      resultado.add(serie);
    }

    if (condicion != null) {
      resultado = resultado.where(condicion).toList();
    }

    if (comparador != null) {
      resultado.sort(comparador);
    }

    return resultado;
  }
}