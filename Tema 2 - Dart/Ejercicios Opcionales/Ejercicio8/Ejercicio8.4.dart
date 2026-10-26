void main() {
    String formatearNombre({
    required String nombre,
    required String apellido
  }) {
    return "${nombre.toUpperCase()} ${apellido.toUpperCase()}";
  }

  print(
    formatearNombre(
      nombre: "Xoel",
      apellido: "Rodicio"
    )
  );
}