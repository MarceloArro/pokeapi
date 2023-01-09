import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/tab/pokemon_detail_about.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/tab/pokemon_detail_move.dart';
import 'package:poke_api_ma/feature/pokemon/presentation/pokemon/widget/tab/pokemon_detail_stat.dart';

class TabBarModel {
  const TabBarModel({required this.title, required this.child});

  final String title;
  final Widget child;
}

class PokemonDetailTab extends StatefulWidget {
  const PokemonDetailTab({super.key});

  @override
  State<PokemonDetailTab> createState() => _PokemonDetailTabState();
}

class _PokemonDetailTabState extends State<PokemonDetailTab> {
  final List<TabBarModel> tabBarList = [];

  @override
  void initState() {
    super.initState();
    tabBarList.addAll([
      const TabBarModel(title: 'About', child: PokemonDetailAbout()),
      const TabBarModel(title: 'Stats', child: PokemonDetailStat()),
      // const TabBarModel(title: 'Evolution', child: PokemonDetailEvolution()),
      const TabBarModel(title: 'Moves', child: PokemonDetailMove())
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabBarList.length,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(26),
          topRight: Radius.circular(26),
        ),
        child: Material(
          color: AppColors.whiteGrey,
          child: Column(
            children: [
              TabBar(
                labelColor: AppColors.black,
                unselectedLabelColor: AppColors.grey,
                labelPadding: const EdgeInsets.symmetric(vertical: 16),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColors.indigo,
                tabs: tabBarList.map((e) => Text(e.title)).toList(),
              ),
              Expanded(
                child: TabBarView(
                  children: tabBarList.map((e) => e.child).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
