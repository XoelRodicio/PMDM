import 'dart:io';

class Lector {
  static String _leerLinea() {
    final linea = stdin.readLineSync();
    if (linea == null) {
      print('\nNo se puede leer');
      exit(0);
    }
    return linea.trim();
  }

  static String leerTexto() {
    while (true) {
      final texto = _leerLinea();
      if (texto.isNotEmpty) {
        return texto;
      }
      print('No puede estar vacío');
    }
  }

  static int leerEntero({
    required int minimo,
    required int maximo,
  }) {
    while (true) {
      final numero = int.tryParse(_leerLinea());
      if (numero != null && numero >= minimo && numero <= maximo) {
        return numero;
      }
      print('Escribe un número entre $minimo y $maximo.');
    }
  }

  static double leerDecimal({
    required double minimo,
    required double maximo,
  }) {
    while (true) {
      final texto = _leerLinea().replaceAll(',', '.');
      final numero = double.tryParse(texto);
      if (numero != null && numero >= minimo && numero <= maximo) {
        return numero;
      }
      print('Escribe un número entre $minimo y $maximo.');
    }
  }

  static bool confirmar() {
    while (true) {
      final respuesta = _leerLinea().toLowerCase();
      if (respuesta == 's') {
        return true;
      }
      if (respuesta == 'n') {
        return false;
      }
      print('Responde (S/N)');
    }
  }

  static void pausa() {
    print('Pulsa Enter para continuar');
    _leerLinea();
  }
}
