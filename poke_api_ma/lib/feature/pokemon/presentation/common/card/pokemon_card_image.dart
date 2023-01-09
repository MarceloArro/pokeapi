import 'package:flutter/material.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/pokemon_image.dart';

class CardPokemonImage extends StatelessWidget {
  const CardPokemonImage({
    super.key,
    required this.pokemonImageUrl,
    required this.height,
  });

  final String pokemonImageUrl;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -4,
      right: 0,
      child: PokemonImage(
        size: Size.square(height * 0.68),
        imageUrl: pokemonImageUrl,
      ),
    );
  }
}
