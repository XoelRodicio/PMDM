void main() {
  int? idade = null;
  print(idade == null ? "Sen idade" : "Idade Par?: ${idade.isEven}");

  final data = DateTime.now();
  print(data);
}