import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_official_artwork.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonOfficialArtwork extends Equatable {
  const PokemonOfficialArtwork({
    required this.frontDefault,
  });

  factory PokemonOfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$PokemonOfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonOfficialArtworkToJson(this);

  @JsonKey(name: 'front_default')
  final String frontDefault;

  PokemonOfficialArtwork copyWith({
    String? frontDefault,
  }) =>
      PokemonOfficialArtwork(
        frontDefault: frontDefault ?? this.frontDefault,
      );

  @override
  List<Object?> get props => [
        frontDefault,
      ];
}
