import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';

class ScaffoldPokeballBackground extends StatelessWidget {
  const ScaffoldPokeballBackground({
    super.key,
    required this.child,
    this.floatingActionButton,
  });

  final Widget child;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteGrey,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            top: -40,
            right: -60,
            child: Image(
              image: AssetImage(AppAssets.pokeball),
              width: 180,
              height: 180,
              color: AppColors.lightGrey,
            ),
          ),
          child,
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
