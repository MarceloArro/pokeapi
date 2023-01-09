import 'dart:ui';

import 'package:poke_api_ma/core/constant/assets_constant.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';

enum PokemonTypeEnum {
  bug(
    typeId: 1,
    typeName: 'bug',
    typeColor: AppColors.bug,
    svgIcon: AppAssets.bug,
  ),
  dark(
    typeId: 2,
    typeName: 'dark',
    typeColor: AppColors.dark,
    svgIcon: AppAssets.dark,
  ),
  dragon(
    typeId: 3,
    typeName: 'dragon',
    typeColor: AppColors.dragon,
    svgIcon: AppAssets.dragon,
  ),
  electric(
    typeId: 4,
    typeName: 'electric',
    typeColor: AppColors.electric,
    svgIcon: AppAssets.electric,
  ),
  fire(
    typeId: 5,
    typeName: 'fire',
    typeColor: AppColors.fire,
    svgIcon: AppAssets.fire,
  ),
  fairy(
    typeId: 6,
    typeName: 'fairy',
    typeColor: AppColors.fairy,
    svgIcon: AppAssets.fairy,
  ),
  fighting(
    typeId: 7,
    typeName: 'fighting',
    typeColor: AppColors.fighting,
    svgIcon: AppAssets.fighting,
  ),
  flying(
    typeId: 8,
    typeName: 'flying',
    typeColor: AppColors.flying,
    svgIcon: AppAssets.flying,
  ),
  ghost(
    typeId: 9,
    typeName: 'ghost',
    typeColor: AppColors.ghost,
    svgIcon: AppAssets.ghost,
  ),
  grass(
    typeId: 10,
    typeName: 'grass',
    typeColor: AppColors.grass,
    svgIcon: AppAssets.grass,
  ),
  ground(
    typeId: 11,
    typeName: 'ground',
    typeColor: AppColors.ground,
    svgIcon: AppAssets.ground,
  ),
  ice(
    typeId: 12,
    typeName: 'ice',
    typeColor: AppColors.ice,
    svgIcon: AppAssets.ice,
  ),
  normal(
    typeId: 13,
    typeName: 'normal',
    typeColor: AppColors.normal,
    svgIcon: AppAssets.normal,
  ),
  poison(
    typeId: 14,
    typeName: 'poison',
    typeColor: AppColors.poison,
    svgIcon: AppAssets.poison,
  ),
  psychic(
    typeId: 15,
    typeName: 'psychic',
    typeColor: AppColors.psychic,
    svgIcon: AppAssets.psychic,
  ),
  rock(
    typeId: 16,
    typeName: 'rock',
    typeColor: AppColors.rock,
    svgIcon: AppAssets.rock,
  ),
  steel(
    typeId: 17,
    typeName: 'steel',
    typeColor: AppColors.steel,
    svgIcon: AppAssets.steel,
  ),
  water(
    typeId: 18,
    typeName: 'water',
    typeColor: AppColors.water,
    svgIcon: AppAssets.water,
  );

  const PokemonTypeEnum({
    required this.typeId,
    required this.typeName,
    required this.typeColor,
    required this.svgIcon,
  });

  final int typeId;
  final String typeName;
  final Color typeColor;
  final String svgIcon;
}
