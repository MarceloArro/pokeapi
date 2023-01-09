import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/enum/pokemon_type_enum.dart';
import 'package:poke_api_ma/feature/pokemon/data/pokemon.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/card/pokemon_card_content.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/card/pokemon_card_image.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/card/pokemon_card_number.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/card/pokemon_card_pokeball_background.dart';

class PokemonCard extends StatefulWidget {
  const PokemonCard({
    super.key,
    required this.pokemon,
    required this.onPress,
  });

  final Pokemon pokemon;
  final VoidCallback onPress;

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  final pokemonTypeEnumList = <PokemonTypeEnum>[];

  void getPokemonTypeEnum() {
    pokemonTypeEnumList.addAll(
      widget.pokemon.types.map(
        (type) => PokemonTypeEnum.values.firstWhere(
          (typeEnum) => typeEnum.typeName == type.type.name,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getPokemonTypeEnum();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final itemHeight = constrains.maxHeight;

        return ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Material(
            color: pokemonTypeEnumList.isEmpty
                ? AppColors.red
                : pokemonTypeEnumList[0].typeColor,
            child: InkWell(
              onTap: widget.onPress,
              child: Stack(
                children: [
                  CardPokeballBackground(
                    height: itemHeight,
                  ),
                  CardPokemonImage(
                    height: itemHeight,
                    pokemonImageUrl: widget
                        .pokemon.sprites.other.officialArtwork.frontDefault,
                  ),
                  CardPokemonNumber(
                    pokemonId: widget.pokemon.id.toString(),
                  ),
                  CardContent(
                    pokemonId: widget.pokemon.id,
                    pokemonName: widget.pokemon.name,
                    pokemonTypeEnumList: pokemonTypeEnumList,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
