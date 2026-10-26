class Persoa {
  String nome;

  Persoa({required this.nome});

  // @override
  // String toString() {
  //   return "Persoa - Nome: $nome";
  // }

  void presentarse() {
    print("Hola, son $nome");
  }

  static bool serVivo() {
    return true;
  }
}

class Profesor extends Persoa {
  String centro;
  Profesor({required super.nome, this.centro = "Sen centro"});

  @override
  void presentarse() {
    print("Hola, son $nome y trabajo en el $centro");
  }
}

class Curso {
  String grupo;
  //Profesor titor;
  void Function() alComenzar;
  Curso({required this.grupo, required this.alComenzar});

  comenzar() {
    print("Hola, grupo $grupo");
    alComenzar();
  }

  // List<Alumno> alumnos:
  // List<Profesor> profes:
}

void avisar() {
  print("Benvidos a PDMD, 2º DAM");
}

void main() {
  var xoel = Persoa(nome: "Xoel");
  var toni = Profesor(nome: "Toni", centro: "IES San Mamede");
  toni.presentarse();
  xoel.presentarse();
  print(Persoa.serVivo());
  var dam2 = Curso(grupo: "A", alComenzar: () => print("Sieg"));
  dam2.comenzar();
}