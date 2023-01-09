import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';
part 'move_effect_entry.g.dart';

@JsonSerializable(explicitToJson: true)
class MoveEffectEntry extends Equatable {
  const MoveEffectEntry({
    this.effect,
    this.shortEffect,
    required this.language,
  });

  factory MoveEffectEntry.fromJson(Map<String, dynamic> json) =>
      _$MoveEffectEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MoveEffectEntryToJson(this);

  final String? effect;

  @JsonKey(name: 'short_effect')
  final String? shortEffect;

  final NamedAPIResource language;

  MoveEffectEntry copyWith({
    String? effect,
    String? shortEffect,
    NamedAPIResource? language,
  }) =>
      MoveEffectEntry(
        effect: effect ?? this.effect,
        shortEffect: shortEffect ?? this.shortEffect,
        language: language ?? this.language,
      );

  @override
  List<Object?> get props => [
        effect,
        shortEffect,
        language,
      ];
}
