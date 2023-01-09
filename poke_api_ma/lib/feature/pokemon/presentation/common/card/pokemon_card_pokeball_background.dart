import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';

class CardPokeballBackground extends StatelessWidget {
  const CardPokeballBackground({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -height * 0.12,
      right: -height * 0.02,
      child: Image(
        image: const AssetImage(AppAssets.pokeball),
        height: height * 0.8,
        width: height * 0.8,
        color: Colors.white.withOpacity(0.14),
      ),
    );
  }
}
