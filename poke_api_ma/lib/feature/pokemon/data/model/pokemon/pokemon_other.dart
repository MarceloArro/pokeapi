import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_dream_world.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_home.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_official_artwork.dart';

part 'pokemon_other.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonOther extends Equatable {
  const PokemonOther({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });
  factory PokemonOther.fromJson(Map<String, dynamic> json) =>
      _$PokemonOtherFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonOtherToJson(this);

  @JsonKey(name: 'dream_world')
  final PokemonDreamWorld dreamWorld;

  final PokemonHome home;

  @JsonKey(name: 'official-artwork')
  final PokemonOfficialArtwork officialArtwork;

  PokemonOther copyWith({
    PokemonDreamWorld? dreamWorld,
    PokemonHome? home,
    PokemonOfficialArtwork? officialArtwork,
  }) =>
      PokemonOther(
        dreamWorld: dreamWorld ?? this.dreamWorld,
        home: home ?? this.home,
        officialArtwork: officialArtwork ?? this.officialArtwork,
      );

  @override
  List<Object?> get props => [
        dreamWorld,
        home,
        officialArtwork,
      ];
}
