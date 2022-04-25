//Criando model dos itens e seus atributos
class Item {
  int id;
  String name;

//fazendo a conversão dos dados
  Item.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'];

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
