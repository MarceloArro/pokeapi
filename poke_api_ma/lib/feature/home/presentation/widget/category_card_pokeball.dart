import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';

class CategoryCardPokeball extends StatelessWidget {
  const CategoryCardPokeball({
    super.key,
    required this.cardHeight,
  });

  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -cardHeight * 0.25,
      child: Image(
        image: const AssetImage(AppAssets.pokeball),
        width: cardHeight * 1.1,
        height: cardHeight * 1.1,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }
}
