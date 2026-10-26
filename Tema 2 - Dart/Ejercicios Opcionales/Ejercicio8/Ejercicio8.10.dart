int triple (int n) => n * 3;

void main() {
  int Function (int) multiplicacion = triple;
  print(multiplicacion(5));
}