import 'package:flutter/material.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/card/pokemon_info_card_app_bar.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/card/pokemon_info_card_name.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/card/pokemon_info_card_pokemon_image.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/card/pokemon_info_card_pokemon_type_chip_list.dart';

class PokemonOverlayInfo extends StatelessWidget {
  const PokemonOverlayInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        PokemonInfoCardAppBar(),
        SizedBox(height: 8),
        PokemonInfoCardName(),
        PokemonTypesChipListWidget(),
        SizedBox(height: 16),
        PokemonInfoCardPokemonImage()
      ],
    );
  }
}
