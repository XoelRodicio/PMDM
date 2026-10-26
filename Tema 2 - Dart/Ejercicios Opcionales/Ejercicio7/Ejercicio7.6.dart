void main() {
    final direccion = (
    calle: "Calle del Paseo",
    ciudad: "Ourense"
  );

  final usuario6 = (
    nombre: "Vinicius José Paixao de Oliveira Jr",
    edad: 66,
    direccion: direccion
  );

  print("Nombre: ${usuario6.nombre}");
  print("Edad: ${usuario6.edad}");
  print("Calle: ${usuario6.direccion.calle}");
  print("Ciudad: ${usuario6.direccion.ciudad}");
}