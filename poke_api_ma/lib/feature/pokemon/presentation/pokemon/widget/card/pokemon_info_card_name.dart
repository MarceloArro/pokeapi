import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/extension/string_extension.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/cubit/pokemon_detail_cubit.dart';

class PokemonInfoCardName extends StatelessWidget {
  const PokemonInfoCardName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
        buildWhen: (previous, current) => previous.pokemon != current.pokemon,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                state.pokemon?.name.firstLetterToUpperCase ?? '',
                style: const TextStyle(
                  color: AppColors.whiteGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 36,
                ),
              ),
              Text(
                '#${state.pokemon?.id.toString().padLeft(4, '0')}',
                style: const TextStyle(
                  color: AppColors.whiteGrey,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
