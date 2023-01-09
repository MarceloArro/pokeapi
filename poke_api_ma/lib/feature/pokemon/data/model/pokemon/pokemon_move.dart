import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/pokemon/pokemon_version_group_detail.dart';

part 'pokemon_move.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonMove extends Equatable {
  const PokemonMove({
    required this.move,
    required this.versionGroupDetails,
  });

  factory PokemonMove.fromJson(Map<String, dynamic> json) =>
      _$PokemonMoveFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonMoveToJson(this);

  final NamedAPIResource move;

  @JsonKey(name: 'version_group_details')
  final List<PokemonVersionGroupDetail> versionGroupDetails;

  PokemonMove copyWith({
    NamedAPIResource? move,
    List<PokemonVersionGroupDetail>? versionGroupDetails,
  }) =>
      PokemonMove(
        move: move ?? this.move,
        versionGroupDetails: versionGroupDetails ?? this.versionGroupDetails,
      );

  @override
  List<Object?> get props => [
        move,
        versionGroupDetails,
      ];
}
