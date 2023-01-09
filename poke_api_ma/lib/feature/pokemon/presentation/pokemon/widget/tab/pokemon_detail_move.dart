import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/enum/pokemon_type_enum.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/cubit/pokemon_detail_cubit.dart';

class PokemonDetailMove extends StatelessWidget {
  const PokemonDetailMove({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        if (state.pokemonMovement.isEmpty) {
          return Container();
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.pokemonMovement.length,
          itemBuilder: (BuildContext context, int index) {
            log(state.pokemonMovement.length.toString());
            final pokemonTypeEnum = PokemonTypeEnum.values.firstWhere(
              (element) =>
                  element.typeName == state.pokemonMovement[index].type.name,
            );
            return ListTile(
              title: Text(
                state.pokemonMovement[index].names
                    .firstWhere((element) => element.language.name == 'en')
                    .name,
              ),
              subtitle: Text(
                state.pokemonMovement[index].lvlUp != null
                    ? state.pokemonMovement[index].lvlUp.toString()
                    : '',
              ),
              trailing: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: pokemonTypeEnum.typeColor,
                ),
                child: SvgPicture.asset(
                  pokemonTypeEnum.svgIcon,
                  width: 20,
                  height: 20,
                  color: AppColors.whiteGrey,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
