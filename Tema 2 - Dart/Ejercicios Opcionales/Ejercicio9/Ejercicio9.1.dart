void main() {
  List<String> lista = ["Francisco","Benito","Adolfo"];

  print("For clasico");
  for (int i = 0; i < lista.length; i++) {
    print("Lista[$i]: ${lista[i]}");
  }

  print("For-In");
  for (var l in lista) {
    print("$l");
  }

  print("ForEach");
  lista.forEach((String lista) => print(lista));
}