void main() {
    final List<Object> datos = [1,"Diego",3];

  int suma = 0;

  for (final dato in datos) {
    if (dato is int) {
      suma += dato;
    }
  }
}