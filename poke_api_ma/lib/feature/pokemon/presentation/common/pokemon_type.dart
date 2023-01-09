import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/enum/pokemon_type_enum.dart';
import 'package:poke_api_ma/core/extension/string_extension.dart';

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({
    super.key,
    required this.type,
    this.large = false,
    this.colored = false,
  });

  final PokemonTypeEnum type;

  final bool large;
  final bool colored;

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).backgroundColor;
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 19 : 12,
          vertical: large ? 6 : 4,
        ),
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: (colored ? type.typeColor : bgColor).withOpacity(0.2),
        ),
        child: Text(
          type.name.firstLetterToUpperCase,
          textScaleFactor: 1,
          style: TextStyle(
            fontSize: large ? 12 : 8,
            fontWeight: large ? FontWeight.bold : FontWeight.normal,
            color: colored ? type.typeColor : bgColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
