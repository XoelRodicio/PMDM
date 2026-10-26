(String, int) crearUsuario(String nombre, int idade) {
  return (nombre, idade); 
}

({String nombre, int idade}) crearUsuario2(String x, int y) {
  return (nombre: x, idade: y); 
}

void main() {
  print(crearUsuario("Xoel", 19));
  print(crearUsuario2("Diego", 3));
}