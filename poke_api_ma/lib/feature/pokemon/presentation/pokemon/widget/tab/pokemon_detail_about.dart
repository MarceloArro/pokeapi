import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/extension/string_extension.dart';
import 'package:poke_api_ma/core/util/gender_util.dart';
import 'package:poke_api_ma/core/util/text_entries_util.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/cubit/pokemon_detail_cubit.dart';

class PokemonDetailAbout extends StatelessWidget {
  const PokemonDetailAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            PokemonDetailAboutDescription(),
            SizedBox(height: 12),
            PokemonDetailAboutCharacteristics(),
            SizedBox(height: 20),
            PokemonAbilities(),
            SizedBox(height: 12),
            PokemonDetailAboutBreeding(),
          ],
        ),
      ),
    );
  }
}

class PokemonDetailAboutDescription extends StatelessWidget {
  const PokemonDetailAboutDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      buildWhen: (previous, current) =>
          previous.pokemonSpecies != current.pokemonSpecies,
      builder: (context, state) {
        if (state.pokemonSpecies != null) {
          return Align(
            child: Text(
              textEntriesUtil(state.pokemonSpecies!.flavorTextEntries),
              textAlign: TextAlign.justify,
            ),
          );
        }
        return Container();
      },
    );
  }
}

class PokemonDetailAboutCharacteristics extends StatelessWidget {
  const PokemonDetailAboutCharacteristics({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(2, 8),
            blurRadius: 23,
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  'Height',
                  style: TextStyle(
                    color: AppColors.black.withOpacity(0.9),
                    height: 0.8,
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  ((context.watch<PokemonDetailCubit>().state.pokemon!.height) *
                          0.1)
                      .toStringAsFixed(2),
                  style: const TextStyle(
                    height: 0.8,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  'Weight',
                  style: TextStyle(
                    color: AppColors.black.withOpacity(0.9),
                    height: 0.8,
                  ),
                ),
                const SizedBox(height: 11),
                Text(
                  ((context.watch<PokemonDetailCubit>().state.pokemon!.weight) *
                          0.1)
                      .toStringAsFixed(2),
                  style: const TextStyle(
                    height: 0.8,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PokemonDetailAboutBreeding extends StatelessWidget {
  const PokemonDetailAboutBreeding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Breeding',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Text('Gender'),
            const SizedBox(
              width: 8,
            ),
            BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
              buildWhen: (previous, current) =>
                  previous.pokemonSpecies != current.pokemonSpecies,
              builder: (context, state) {
                if (state.pokemonSpecies == null) {
                  return Container();
                }
                final genderRatio = getGenderRatios(
                  genderRate: state.pokemonSpecies!.genderRate,
                );

                if (genderRatio == null) {
                  return const Text('Genderless');
                }
                return Row(
                  children: [
                    TextIcon(
                      const AssetImage(AppAssets.maleGender),
                      '${genderRatio.maleRatio}%',
                    ),
                    const SizedBox(width: 8),
                    TextIcon(
                      const AssetImage(AppAssets.femaleGender),
                      '${genderRatio.femaleRatio}%',
                    ),
                  ],
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 12),
        BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
          buildWhen: (previous, current) =>
              previous.pokemonSpecies != current.pokemonSpecies,
          builder: (context, state) {
            if (state.pokemonSpecies == null ||
                state.pokemonSpecies!.captureRate == null) {
              return Container();
            }
            return Row(
              children: [
                const Text('Capture rate:'),
                const SizedBox(width: 4),
                Text('${state.pokemonSpecies!.captureRate}%')
              ],
            );
          },
        ),
        const SizedBox(height: 12),
        BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
          buildWhen: (previous, current) =>
              previous.pokemonSpecies != current.pokemonSpecies,
          builder: (context, state) {
            if (state.pokemonSpecies == null) {
              return Container();
            }
            return Row(
              children: [
                const Text('Generation:'),
                const SizedBox(width: 4),
                Text(
                  state.pokemonSpecies!.generation.name
                      .split('-')
                      .last
                      .toUpperCase(),
                )
              ],
            );
          },
        ),
        const SizedBox(height: 32)
      ],
    );
  }
}

class PokemonAbilities extends StatelessWidget {
  const PokemonAbilities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        if (state.pokemon == null) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Abilities',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: state.pokemon!.abilities
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          e.ability.name
                              .replaceAll('-', ' ')
                              .firstLetterToUpperCase,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            )
          ],
        );
      },
    );
  }
}

class TextIcon extends StatelessWidget {
  const TextIcon(this.icon, this.text, {super.key});
  final ImageProvider icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(image: icon, width: 12, height: 12),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(height: 0.8)),
      ],
    );
  }
}
