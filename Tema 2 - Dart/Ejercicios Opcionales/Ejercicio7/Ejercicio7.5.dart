void main() {
  final List<({
    String nombre,
    int edad
  })> usuarios = [
    (
      nombre: "Valentino Rossi",
      edad: 33
    ),
    (
      nombre: "Casey Stoner",
      edad: 22
    ),
    (
      nombre: "Jorge Lorenzo",
      edad: 66
    )
  ];

  for (final usuario in usuarios) {
    print("${usuario.nombre} - ${usuario.edad} años");
  }
}