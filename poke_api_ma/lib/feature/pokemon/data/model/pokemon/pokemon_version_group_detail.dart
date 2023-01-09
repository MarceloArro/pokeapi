import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'pokemon_version_group_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonVersionGroupDetail extends Equatable {
  const PokemonVersionGroupDetail({
    required this.levelLearnedAt,
    required this.versionGroup,
    required this.moveLearnMethod,
  });

  factory PokemonVersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$PokemonVersionGroupDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonVersionGroupDetailToJson(this);

  @JsonKey(name: 'level_learned_at')
  final int levelLearnedAt;

  @JsonKey(name: 'version_group')
  final NamedAPIResource versionGroup;

  @JsonKey(name: 'move_learn_method')
  final NamedAPIResource moveLearnMethod;

  PokemonVersionGroupDetail copyWith({
    int? levelLearnedAt,
    NamedAPIResource? versionGroup,
    NamedAPIResource? moveLearnMethod,
  }) =>
      PokemonVersionGroupDetail(
        levelLearnedAt: levelLearnedAt ?? this.levelLearnedAt,
        versionGroup: versionGroup ?? this.versionGroup,
        moveLearnMethod: moveLearnMethod ?? this.moveLearnMethod,
      );

  @override
  List<Object?> get props => [
        levelLearnedAt,
        versionGroup,
        moveLearnMethod,
      ];
}
