import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'pokemon_ability.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonAbility extends Equatable {
  const PokemonAbility({
    required this.ability,
    this.slot,
    this.isHidden = false,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);

  final NamedAPIResource ability;

  final int? slot;

  @JsonKey(name: 'is_hidden')
  final bool isHidden;

  PokemonAbility copyWith({
    bool? isHidden,
    int? slot,
    NamedAPIResource? ability,
  }) =>
      PokemonAbility(
        ability: ability ?? this.ability,
        slot: slot ?? this.slot,
        isHidden: isHidden ?? this.isHidden,
      );

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [
        isHidden,
        slot,
        ability,
      ];
}
