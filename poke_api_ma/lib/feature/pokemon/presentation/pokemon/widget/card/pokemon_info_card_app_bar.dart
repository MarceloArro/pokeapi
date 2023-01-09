import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';

class PokemonInfoCardAppBar extends StatelessWidget {
  const PokemonInfoCardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        icon: const Icon(Icons.arrow_back, color: AppColors.whiteGrey),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}
