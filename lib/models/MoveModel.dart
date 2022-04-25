//Criando model dos movimentos e seus atributos
class Move {
  int id;
  String name;

//fazendo a conversão dos dados
  Move.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
