import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';
part 'species_genus.g.dart';

@JsonSerializable(explicitToJson: true)
class SpeciesGenus {
  SpeciesGenus({
    required this.genus,
    required this.language,
  });

  factory SpeciesGenus.fromJson(Map<String, dynamic> json) =>
      _$SpeciesGenusFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesGenusToJson(this);

  final String genus;
  final NamedAPIResource language;

  SpeciesGenus copyWith({
    String? genus,
    NamedAPIResource? language,
  }) =>
      SpeciesGenus(
        genus: genus ?? this.genus,
        language: language ?? this.language,
      );
}
