import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/api/pokeapi.dart';
import 'package:unc_flutter_pokedex/models/PokeModel.dart';
import 'package:unc_flutter_pokedex/widgets/pokemon_grid.dart';

//tela principal do app, onde exibe os pokemons
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pokemon> pokemon = List.empty();

  //chamando o estado inicial da tela, onde pega os dados da API
  @override
  void initState() {
    super.initState();
    getPokemonFromPokeApi();
  }

  //pegando os dados da API e Criando uma Lista com eles em ordem de ID
  void getPokemonFromPokeApi() async {
    PokeAPI.getPokemon().then((response) {
      List<Map<String, dynamic>> data =
          List.from(json.decode(response.body)['results']);
      setState(() {
        pokemon = data.asMap().entries.map<Pokemon>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${element.key + 1}.png";
          return Pokemon.fromJson(element.value);
        }).toList();
      });
    });
  }

  //Criando o esquleto(scaffold) da tela chamando o GRID dos elementos de itens
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        //menu lateral com os botoes de acesso as outras telas
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            //header do menu onde mostra o titulo e logo
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/188/188987.png'),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Pokédex',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            //links do menu para acessar as outras telas
            ListTile(
              leading: const Icon(Icons.shield),
              title: const Text(
                'Tipos',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/types");
              },
            ),
            ListTile(
              leading: const Icon(Icons.moving),
              title: const Text('Habilidades', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/abilities");
              },
            ),
            ListTile(
              leading: const Icon(Icons.track_changes),
              title: const Text('Movimentos', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/moves");
              },
            ),
            ListTile(
              leading: const Icon(Icons.local_mall),
              title: const Text('Itens', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/items");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Pokédex"),
      ),
      body: PokemonGrid(pokemon: pokemon),
      //botao flutuante para compartilhar
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Share',
        child: const Icon(
          Icons.share_rounded,
        ),
      ),
    );
  }
}
