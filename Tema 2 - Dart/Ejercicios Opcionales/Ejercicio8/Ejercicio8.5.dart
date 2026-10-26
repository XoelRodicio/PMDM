void main() {
    String formatearNombreOpcional({
    String? nombre,
    String? apellido
  }) {
    String resultado = "";

    if (nombre != null) {
      resultado += nombre.toUpperCase();
    }

    if (apellido != null) {
      if (resultado.isNotEmpty) {
        resultado += " ";
      }

      resultado += apellido.toUpperCase();
    }

    return resultado;
  }

  print(
    formatearNombreOpcional(
      nombre: "Xoel",
      apellido: "Rodicio"
    )
  );

  print(
    formatearNombreOpcional(
      nombre: "Xoel"
    )
  );

  print(
    formatearNombreOpcional(
      apellido: "Rodicio"
    )
  );
}