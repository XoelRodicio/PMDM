void main() {
    final List<String> colores2 = [
    "vermello",
    "verde",
    "azul"
  ];

  colores2[1] = "amarelo";
  colores2.removeAt(0);
  print(colores2);
}