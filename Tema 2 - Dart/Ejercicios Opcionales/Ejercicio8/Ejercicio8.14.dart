({int minimo, int maximo}) minMax(List<int> lista) {
  int max = lista.first;
  int min = lista[0];

  for (var num in lista) {
    if (num < min) {
      min = num;
    } 
    if (num > max) {
      max = num;
    }
  }

  return(minimo: min, maximo: max);
}
void main() {
   List<int> listaNum = [2,34,56,12,4,3];
   print(minMax(listaNum));
}