import 'serie.dart';

String _limpiar(String texto) {
  texto = texto.toLowerCase();

  texto = texto.replaceAll('á', 'a');
  texto = texto.replaceAll('é', 'e');
  texto = texto.replaceAll('í', 'i');
  texto = texto.replaceAll('ó', 'o');
  texto = texto.replaceAll('ú', 'u');

  return texto;
}

bool Function(Serie) filtroPorTexto(String texto) {
  texto = _limpiar(texto.trim());

  return (serie) {
    return _limpiar(serie.titulo).contains(texto) ||
        _limpiar(serie.genero.texto).contains(texto);
  };
}

int Function(Serie, Serie) comparadorPorTitulo() {
  return (a, b) {
    return a.titulo.toLowerCase().compareTo(b.titulo.toLowerCase());
  };
}

int Function(Serie, Serie) comparadorPorValoracion() {
  return (a, b) {
    return b.valoracion.compareTo(a.valoracion);
  };
}