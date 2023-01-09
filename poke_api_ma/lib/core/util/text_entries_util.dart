import 'package:poke_api_ma/feature/pokemon/data/pokemon.dart';

String textEntriesUtil(List<FlavorText> flavorTextList) {
  final text = flavorTextList.firstWhere(
    (flavorText) =>
        flavorText.language.name == 'en' &&
        (flavorText.version.name == 'sword' ||
            flavorText.version.name == 'shield' ||
            flavorText.version.name == 'ultra-moon'),
  );
  return text.flavorText;
}

const String heightUnit = 'ft';
String convertHeightToFoot(int? height) {
  if (height == null) return '0 $heightUnit';

  return '${height / 3.048} $heightUnit';
}

const String weightUnit = 'lbs';
String convertWeightToLib(int? weight) {
  if (weight == null) return '0 $weightUnit';

  return '${weight * 0.22} $weightUnit';
}
