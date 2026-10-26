import 'genero.dart';

class Serie {
  final String id;
  final String titulo;
  final Genero genero;
  final int ano;
  final int temporadas;
  final String plataforma;
  final double valoracion;

  Serie({
    required this.id,
    required this.titulo,
    required this.genero,
    required this.ano,
    required this.temporadas,
    required this.plataforma,
    required this.valoracion,
  });

  @override
  String toString() {
    return 'ID: {$id} \n Titulo: {$titulo} \n Genero: {$genero} \n Año: {$ano} \n Temporadas: {$temporadas} \n Plataforma: {$plataforma} \n Valoración: {$valoracion}';
  }
}
