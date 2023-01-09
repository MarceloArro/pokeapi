import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/enum/pokemon_type_enum.dart';
import 'package:poke_api_ma/core/util/gender_util.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/pokemon_type.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
    required this.pokemonId,
    required this.pokemonName,
    required this.pokemonTypeEnumList,
  });

  final int pokemonId;
  final String pokemonName;
  final List<PokemonTypeEnum> pokemonTypeEnumList;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 28, left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: pokemonId.toString() + pokemonName,
              child: getPokemonNameGender(pokemonName: pokemonName),
            ),
            const SizedBox(height: 6),
            ...pokemonTypeEnumList.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 3),
                child: PokemonTypeChip(type: e),
              ),
            )
          ],
        ),
      ),
    );
  }
}
