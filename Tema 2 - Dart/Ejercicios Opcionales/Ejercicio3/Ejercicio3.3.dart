void main() {
  Object numero = 42;
  if (numero is int) {
    print("Es par: ${numero.isEven}");
  } else {
    print("No es entero");
  }

  numero as int;
  print("Es par: ${numero.isEven}");
}