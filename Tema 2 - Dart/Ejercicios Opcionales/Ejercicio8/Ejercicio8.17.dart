procesar(List<String> items, {void Function(String) ? onItem}) {
  for (var elemento in items) {
    if (onItem == null) {
      print("onItem == null. Elemento = $elemento");
    } else {
      onItem(elemento);
    }
  }
}

void imprimir(String n) {
  print("Almendrado: $n");
}

void main() {
  List<String> frutas = ["Maza", "Kiwi", "Fresa", "Melon", "Sandia"];
  procesar(frutas);
  procesar(frutas,onItem: imprimir);
  procesar(frutas,onItem:(n) => print("HM: $n"));
}