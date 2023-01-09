import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_other.dart';

part 'pokemon_sprite.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonSprite extends Equatable {
  const PokemonSprite({
    required this.frontDefault,
    required this.other,
    this.frontFemale,
  });
  factory PokemonSprite.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpriteFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpriteToJson(this);

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  @JsonKey(name: 'front_default')
  final String frontDefault;

  final PokemonOther other;

  PokemonSprite copyWith({
    String? frontDefault,
    String? frontFemale,
    PokemonOther? other,
  }) =>
      PokemonSprite(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
        other: other ?? this.other,
      );

  @override
  List<Object?> get props => [
        frontDefault,
        frontFemale,
        other,
      ];
}
