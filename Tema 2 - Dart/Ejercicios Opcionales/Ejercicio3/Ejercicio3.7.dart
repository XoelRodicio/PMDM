void main() {
    Object dato = "Hola";

  if (dato is String) {
    String texto = dato as String;
    print("Es un String: $texto");
  }

  dato = 25;

  if (dato is int) {
    int numero = dato as int;
    print("Es un int: $numero");
  }
}