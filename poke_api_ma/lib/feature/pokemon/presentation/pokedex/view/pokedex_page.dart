import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/feature/pokemon/data/pokemon.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokedex/cubit/pokedex_cubit.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokedex/widget/pokedex_list.dart';
import 'package:poke_api_ma/widget/scaffold_pokeball_background.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokedexCubit(
        pokemonRepository: RepositoryProvider.of<PokemonRepository>(
          context,
        ),
      )..pokemonFetched(),
      child: const PokedexView(),
    );
  }
}

class PokedexView extends StatelessWidget {
  const PokedexView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPokeballBackground(
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: const [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                        fontSize: 30,
                        height: 1.6,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(
                    child: PokedexList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
