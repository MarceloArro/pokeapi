import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/pokemon_image.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/cubit/pokemon_detail_cubit.dart';

class PokemonInfoCardPokemonImage extends StatelessWidget {
  const PokemonInfoCardPokemonImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final pokeballSize = screenSize.width * 0.38;
    final pokemonSize = screenSize.width * 0.35;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Image(
            image: const AssetImage(AppAssets.pokeball),
            width: pokeballSize,
            height: pokeballSize,
            color: Colors.white12,
          ),
        ),
        BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
          builder: (context, state) {
            if (state.pokemon != null) {
              return PokemonImage(
                imageUrl:
                    state.pokemon!.sprites.other.officialArtwork.frontDefault,
                size: Size.square(pokemonSize),
              );
            }
            return Image.asset(
              AppAssets.pokeballLoading,
              height: pokemonSize,
            );
          },
        ),
      ],
    );
  }
}
