import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/enum/pokemon_type_enum.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/cubit/pokemon_detail_cubit.dart';

import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/background/pokemon_detail_background_box_decoration.dart';

class BackgroundDecoration extends StatelessWidget {
  const BackgroundDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
          buildWhen: (previous, current) => previous.pokemon != current.pokemon,
          builder: (context, state) {
            if (state.pokemon == null) {
              return Container(
                constraints: const BoxConstraints.expand(),
                color: AppColors.red,
              );
            }
            final type = PokemonTypeEnum.values.firstWhere(
              (element) => element.name == state.pokemon!.types[0].type.name,
            );
            return Container(
              constraints: const BoxConstraints.expand(),
              color: type.typeColor,
            );
          },
        ),
        const Positioned(
          top: -144 * 0.4,
          left: -144 * 0.4,
          child: BackgroundBoxDecoration(),
        ),
      ],
    );
  }
}
