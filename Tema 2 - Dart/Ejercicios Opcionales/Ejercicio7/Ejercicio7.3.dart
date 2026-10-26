void main() {
    var usuario3 = (
    nombre: "Lewis Hamilton",
    edad: 19
  );

  print("Antes: ${usuario3.nombre}, ${usuario3.edad}");

  usuario3 = (
    nombre: "Sebastian Vettel",
    edad: 20
  );

  print("Despues: ${usuario3.nombre}, ${usuario3.edad}");
}