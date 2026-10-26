void main() {
  String? alcume;

//DOS FORMAS
  alcume ??= "Descoñecido";

  alcume = alcume == null ? "Descoñecido" : alcume.toUpperCase();

  print(alcume);
}