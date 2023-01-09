import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'effect.g.dart';

@JsonSerializable(explicitToJson: true)
class Effect extends Equatable {
  const Effect({
    required this.effect,
    required this.language,
  });

  factory Effect.fromJson(Map<String, dynamic> json) => _$EffectFromJson(json);

  Map<String, dynamic> toJson() => _$EffectToJson(this);

  final String effect;
  final NamedAPIResource language;

  Effect copyWith({
    String? effect,
    NamedAPIResource? language,
  }) =>
      Effect(
        effect: effect ?? this.effect,
        language: language ?? this.language,
      );

  @override
  List<Object?> get props => [
        effect,
        language,
      ];
}
