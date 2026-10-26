void main() {
    final List<String> frutas = [
    "maza",
    "pera",
    "maza",
    "kiwi"
  ];

  print("Primera manza: ${frutas.indexOf("maza")}");
  print("Tiene banana? ${frutas.contains("banana")}");
}