import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'pokemon_stat.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonStat extends Equatable {
  const PokemonStat({
    required this.baseStat,
    required this.stat,
    this.effort,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);

  @JsonKey(name: 'base_stat')
  final int baseStat;
  final int? effort;
  final NamedAPIResource stat;

  PokemonStat copyWith({
    int? baseStat,
    int? effort,
    NamedAPIResource? stat,
  }) =>
      PokemonStat(
        baseStat: baseStat ?? this.baseStat,
        effort: effort ?? this.effort,
        stat: stat ?? this.stat,
      );

  @override
  List<Object?> get props => [
        baseStat,
        stat,
        effort,
      ];
}
