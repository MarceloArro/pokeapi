import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/constant/router_constant.dart';
import 'package:poke_api_ma/feature/home/presentation/widget/category_card.dart';
import 'package:poke_api_ma/widget/scaffold_pokeball_background.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldPokeballBackground(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 60,
              bottom: 16,
            ),
            child: Text(
              'What are you looking for?',
              style: TextStyle(
                fontSize: 30,
                height: 1.6,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                childAspectRatio: 2,
                mainAxisSpacing: 8,
                children: <Widget>[
                  CategoryCard(
                    title: 'Pokedex',
                    cardColor: AppColors.teal,
                    onPress: () {
                      context.push(pokedexPath);
                    },
                  ),
                  CategoryCard(
                    title: 'Moves',
                    cardColor: AppColors.red,
                    onPress: () {},
                  ),
                  CategoryCard(
                    title: 'Abilities',
                    cardColor: AppColors.blue,
                    onPress: () {},
                  ),
                  CategoryCard(
                    title: 'Items',
                    cardColor: AppColors.yellow,
                    onPress: () {},
                  ),
                  CategoryCard(
                    title: 'Locations',
                    cardColor: AppColors.purple,
                    onPress: () {},
                  ),
                  CategoryCard(
                    title: 'Type Effects',
                    cardColor: AppColors.brown,
                    onPress: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
