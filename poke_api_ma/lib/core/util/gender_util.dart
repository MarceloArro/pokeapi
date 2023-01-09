import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poke_api_ma/core/constant/assets_constant.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';
import 'package:poke_api_ma/core/extension/string_extension.dart';
import 'package:poke_api_ma/core/model/gender_model.dart';

const int totalRatio = 8;

GenderRatioModel? getGenderRatios({required int genderRate}) {
  if (genderRate == -1) return null;

  if (genderRate == 0) {
    return const GenderRatioModel(maleRatio: 100, femaleRatio: 0);
  }

  if (genderRate == 8) {
    return const GenderRatioModel(maleRatio: 0, femaleRatio: 100);
  }

  final maleGenderRate = totalRatio - genderRate;

  final malePercent = maleGenderRate / totalRatio * 100;
  final femalePercent = genderRate / totalRatio * 100;

  return GenderRatioModel(
    maleRatio: malePercent,
    femaleRatio: femalePercent,
  );
}

const TextStyle pokemonNameDefaultStyle = TextStyle(
  fontSize: 15,
  height: 0.7,
  fontWeight: FontWeight.bold,
  color: AppColors.whiteGrey,
);

Widget getPokemonNameGender({
  required String pokemonName,
  TextStyle? textStyle,
  double? iconGenderStyle,
}) {
  final nameLength = pokemonName.length;

  if (pokemonName[nameLength - 2] != '-') {
    return Text(
      pokemonName.firstLetterToUpperCase,
      style: textStyle ?? pokemonNameDefaultStyle,
    );
  }

  final splitterName = pokemonName.split('-');

  if (splitterName.last.toLowerCase() == 'f') {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          // alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            splitterName[0].firstLetterToUpperCase,
            style: textStyle ?? pokemonNameDefaultStyle,
          ),
          // alignment: TextAlign.end,
        ),
        const SizedBox(width: 2),
        Image.asset(
          AppAssets.femaleGender,
          height: 21,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  if (splitterName.last.toLowerCase() == 'm') {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          // alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.only(bottom: 2),
          child: Text(
            splitterName[0].firstLetterToUpperCase,
            style: textStyle ?? pokemonNameDefaultStyle,
          ),
          // alignment: TextAlign.end,
        ),
        const SizedBox(width: 2),
        Image.asset(
          AppAssets.maleGender,
          height: 18,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  return Text(
    pokemonName.firstLetterToUpperCase,
    style: textStyle ?? pokemonNameDefaultStyle,
  );
}
