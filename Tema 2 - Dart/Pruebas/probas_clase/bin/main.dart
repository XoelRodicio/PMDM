int compararNotas(int num, int num2) {
  return num.compareTo(num2);
} 

bool estaAprobado(int num) => num >= 5;


main() {
  List<String> lista = ["Epstein", "P.Diddy", "Saddam Hussein", "Osama Bin Laden"];
  List<int> notas = [3,56,4,10,9];

  List<int> aprobados = notas.where(estaAprobado).toList();
  List<int> suspensos = notas.where((int num) {
    return num < 5;
  }).toList();

  List<int> suspensos2 = notas.where((int num) => num < 5).toList();

  print(suspensos);
  print(aprobados);
}