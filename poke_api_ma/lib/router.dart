import 'package:go_router/go_router.dart';
import 'package:poke_api_ma/core/constant/router_constant.dart';
import 'package:poke_api_ma/feature/home/presentation/home.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokedex/view/pokedex_page.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/view/pokemon_detail_page.dart';

final router = GoRouter(
  initialLocation: homePath,
  routes: [
    GoRoute(
      path: homePath,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: pokedexPath,
      builder: (context, state) => const PokedexPage(),
    ),
    GoRoute(
      path: pokemonPath,
      builder: (context, state) => PokemonDetailPage(
        pokemon: state.extra! as Pokemon,
      ),
    ),
  ],
);
