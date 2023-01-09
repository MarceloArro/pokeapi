import 'package:flutter/material.dart';
import 'package:poke_api_ma/core/constant/color_constant.dart';

final lightAppTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.lightGrey,
  backgroundColor: AppColors.whiteGrey,
  brightness: Brightness.light,
  textTheme: const TextTheme(
    bodyText1: lightText,
    bodyText2: lightText,
    labelMedium: lightText,
    caption: lightText,
    button: lightText,
    overline: lightText,
  ),
);

const TextStyle lightText = TextStyle(
  color: AppColors.black,
  fontFamily: 'CircularStd',
);
