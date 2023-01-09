import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/enum/pokemon_stat_enum.dart';
import 'package:poke_api_ma/core/util/stat_util.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_stat.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/cubit/pokemon_detail_cubit.dart';

class PokemonDetailStat extends StatefulWidget {
  const PokemonDetailStat({super.key});

  @override
  State<PokemonDetailStat> createState() => _PokemonDetailStatState();
}

class _PokemonDetailStatState extends State<PokemonDetailStat>
    with SingleTickerProviderStateMixin {
  late Animation<double> _progressAnimation;
  late AnimationController _progressController;

  @override
  void initState() {
    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Curves.easeInOut,
        parent: _progressController,
      ),
    );

    _progressController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _progressController.dispose();

    super.dispose();
  }

  String getBaseStatTotal(List<PokemonStat> stats) {
    num total = 0;
    for (final stat in stats) {
      total += stat.baseStat;
    }
    return 'Total: ${total.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
            builder: (context, state) {
              if (state.pokemon == null) {
                return Container();
              }
              return Column(
                children: [
                  BuildStats(
                    pokemonStats: state.pokemon!.stats,
                    animation: _progressAnimation,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getBaseStatTotal(state.pokemon!.stats),
                        style: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .caption!
                              .color!
                              .withOpacity(0.6),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Min',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .color!
                                  .withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Max',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .color!
                                  .withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class BuildStats extends StatelessWidget {
  const BuildStats({
    super.key,
    required this.pokemonStats,
    required this.animation,
  });

  final List<PokemonStat> pokemonStats;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pokemonStats.map(
        (baseStat) {
          final statEnum = PokemonStatEnum.values
              .firstWhere((element) => element.name == baseStat.stat.name);

          return Stat(
            value: baseStat.baseStat,
            animation: animation,
            label: statEnum.valueName,
            isHp: statEnum.name == 'hp',
          );
        },
      ).toList(),
    );
  }
}

class Stat extends StatelessWidget {
  const Stat({
    super.key,
    required this.animation,
    required this.label,
    required this.value,
    this.progress,
    this.isHp = false,
  });
  final Animation<double> animation;
  final String label;
  final double? progress;
  final int value;
  final bool isHp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: TextStyle(
              color:
                  Theme.of(context).textTheme.caption!.color!.withOpacity(0.6),
            ),
          ),
        ),
        Expanded(
          child: Text('$value'),
        ),
        Expanded(
          flex: 7,
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, widget) {
              final currentProgress = value / 182;
              return LinearProgressIndicator(
                backgroundColor: AppColors.lighterGrey,
                color: currentProgress < 0.5 ? AppColors.red : AppColors.teal,
                value: currentProgress,
              );
            },
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            getPokemonLvl100MinStat(baseStat: value, isHP: isHp).toString(),
          ),
        ),
        Expanded(
          child: Text(
            getPokemonLvl100MaxStat(baseStat: value, isHP: isHp).toString(),
          ),
        ),
      ],
    );
  }
}
