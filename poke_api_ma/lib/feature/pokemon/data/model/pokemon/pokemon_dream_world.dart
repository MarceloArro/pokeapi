import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_dream_world.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonDreamWorld extends Equatable {
  const PokemonDreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  factory PokemonDreamWorld.fromJson(Map<String, dynamic> json) =>
      _$PokemonDreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDreamWorldToJson(this);

  @JsonKey(name: 'front_default')
  final String frontDefault;

  @JsonKey(name: 'front_female')
  final String? frontFemale;

  PokemonDreamWorld copyWith({
    String? frontDefault,
    String? frontFemale,
  }) =>
      PokemonDreamWorld(
        frontDefault: frontDefault ?? this.frontDefault,
        frontFemale: frontFemale ?? this.frontFemale,
      );

  @override
  List<Object?> get props => [
        frontDefault,
        frontFemale,
      ];
}
