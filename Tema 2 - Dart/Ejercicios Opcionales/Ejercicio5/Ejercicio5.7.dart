void main() {
    final List<int> numeros = [1, 2, 3];

  print("Tamaño: ${numeros.length}");
  print("Esta vacía? ${numeros.isEmpty}");

  numeros.clear();

  print("Después de clear:");
  print("Tamaño: ${numeros.length}");
  print("Esta vacía? ${numeros.isEmpty}");
}