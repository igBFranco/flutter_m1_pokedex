import 'package:flutter/material.dart';
import 'package:unc_flutter_pokedex/screens/abilities.dart';
import 'package:unc_flutter_pokedex/screens/detailAbilities.dart';
import 'package:unc_flutter_pokedex/screens/detailItems.dart';
import 'package:unc_flutter_pokedex/screens/detailMoves.dart';
import 'package:unc_flutter_pokedex/screens/details.dart';
import 'package:unc_flutter_pokedex/screens/home.dart';
import 'package:unc_flutter_pokedex/screens/items.dart';
import 'package:unc_flutter_pokedex/screens/moves.dart';
import 'package:unc_flutter_pokedex/screens/types.dart';
import 'package:unc_flutter_pokedex/screens/detailTypes.dart';

void main() {
  // chamando o App para execuçao
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      // iniciando o conceito de navegação por rotas
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        // já criando a rota para exibir os detalhes
        // do pokémon
        "/details": (context) => const Details(),
        "/types": (context) => const Types(),
        "/detailTypes": (context) => const DetailTypes(),
        "/abilities": (context) => const Abilities(),
        "/detailAbilities": (context) => const DetailAbilities(),
        "/moves": (context) => const Moves(),
        "/detailMoves": (context) => const DetailMoves(),
        "/items": (context) => const Items(),
        "/detailItems": (context) => const DetailItems(),
      },
    );
  }
}
