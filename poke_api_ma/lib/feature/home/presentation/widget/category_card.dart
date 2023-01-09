import 'package:flutter/material.dart';
import 'package:poke_api_ma/feature/home/presentation/widget/category_card_circle.dart';
import 'package:poke_api_ma/feature/home/presentation/widget/category_card_pokeball.dart';
import 'package:poke_api_ma/feature/home/presentation/widget/category_card_title.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.title,
    required this.cardColor,
    required this.onPress,
  });

  final String title;
  final Color cardColor;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final cardHeight = constrains.maxHeight;
        return Material(
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            splashColor: Colors.white10,
            highlightColor: Colors.white10,
            onTap: onPress,
            child: Stack(
              children: [
                CategoryCardPokeball(cardHeight: cardHeight),
                CategoryCardCircle(cardHeight: cardHeight),
                Align(
                  alignment: Alignment.centerLeft,
                  child: CategoryCardTitle(title: title),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
