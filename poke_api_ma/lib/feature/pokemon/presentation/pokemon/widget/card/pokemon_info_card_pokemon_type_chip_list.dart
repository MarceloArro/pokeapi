import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/enum/pokemon_type_enum.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/common/pokemon_type.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/cubit/pokemon_detail_cubit.dart';

class PokemonTypesChipListWidget extends StatelessWidget {
  const PokemonTypesChipListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
              buildWhen: (previous, current) =>
                  previous.pokemon != current.pokemon,
              builder: (context, state) {
                if (state.pokemon != null && state.pokemon!.types.isNotEmpty) {
                  return Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      ...PokemonTypeEnum.values.take(2).map(
                            (type) => PokemonTypeChip(
                              type: type,
                              large: true,
                            ),
                          ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
          BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
            builder: (context, state) {
              if (state.pokemonSpecies != null) {
                return Text(
                  state.pokemonSpecies!.genera
                      .firstWhere(
                        (element) =>
                            element.language.name.toLowerCase() == 'en',
                      )
                      .genus,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: AppColors.whiteGrey),
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }
}
