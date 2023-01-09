import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_home.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonHome extends Equatable {
  const PokemonHome({
    required this.frontDefault,
    required this.frontFemale,
  });

  factory PokemonHome.fromJson(Map<String, dynamic> json) =>
      _$PokemonHomeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonHomeToJson(this);

  @JsonKey(name: 'front_default')
  final String frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  PokemonHome copyWith({
    String? frontDefault,
    String? frontFemale,
  }) =>
      PokemonHome(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
      );

  @override
  List<Object?> get props => [
        frontDefault,
        frontFemale,
      ];
}
