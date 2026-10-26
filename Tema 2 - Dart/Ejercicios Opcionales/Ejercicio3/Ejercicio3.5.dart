void main() {
  final identificador = 1;
  String nome = "Diego Rodicio";
  String? telefono;

  telefono ??= "Sen telefono";

  print("Usuario: ${identificador} || nome: ${nome} || telefono: ${telefono}");

  //Se guarda como String porque un int no puede ser una cadenas de caracteres
}