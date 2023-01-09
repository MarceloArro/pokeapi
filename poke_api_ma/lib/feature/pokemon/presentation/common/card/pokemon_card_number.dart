import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';

class CardPokemonNumber extends StatelessWidget {
  const CardPokemonNumber({
    super.key,
    required this.pokemonId,
  });

  final String pokemonId;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 14,
      child: Text(
        '#${pokemonId.padLeft(4, '0')}',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: AppColors.black.withOpacity(0.6),
        ),
      ),
    );
  }
}
