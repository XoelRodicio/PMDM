int aplicar(int x, int y, int Function(int, int) op) {
    return op (x, y);
  }

int sumar(int x, int y) => x + y;

void main() {  
  int resultadoSuma = aplicar(5, 10, sumar);
  int resultadoResta = aplicar(10, 5,(int x, int y) => x - y);

  print("Resultado: $resultadoSuma");
  print("Resultado: $resultadoResta");
}