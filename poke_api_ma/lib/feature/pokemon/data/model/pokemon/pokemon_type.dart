import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'pokemon_type.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonType extends Equatable {
  const PokemonType({
    required this.slot,
    required this.type,
  });
  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeToJson(this);

  final int slot;
  final NamedAPIResource type;

  PokemonType copyWith({
    int? slot,
    NamedAPIResource? type,
  }) =>
      PokemonType(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  @override
  List<Object?> get props => [
        slot,
        type,
      ];
}
