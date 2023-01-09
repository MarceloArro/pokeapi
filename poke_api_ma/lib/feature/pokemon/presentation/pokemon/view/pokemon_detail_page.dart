import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';
import 'package:poke_api_ma/feature/pokemon/data/pokemon.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/cubit/pokemon_detail_cubit.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/background/pokemon_detail_background_decoration.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/card/pokemon_info_card.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/tab/pokemon_detail_tab.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonDetailCubit(
        pokemonRepository: RepositoryProvider.of<PokemonRepository>(
          context,
        ),
      )..getPokemonData(pokemon: pokemon),
      child: const PokemonDetailsView(),
    );
  }
}

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
        builder: (context, state) {
          if (state.status != PokemonStatus.loading) {
            return Stack(
              children: [
                const BackgroundDecoration(),
                const PokemonOverlayInfo(),
                Positioned.fill(
                  top: size.height * 0.41,
                  child: const PokemonDetailTab(),
                )
              ],
            );
          }
          return Center(
            child: SizedBox(
              child: Image.asset(
                AppAssets.pokeballLoading,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PokemonDetailContent extends StatelessWidget {
  const PokemonDetailContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
