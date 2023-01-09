import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'flavor_text.g.dart';

@JsonSerializable(explicitToJson: true)
class FlavorText extends Equatable {
  const FlavorText({
    required this.flavorText,
    required this.language,
    required this.version,
  });
  factory FlavorText.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);

  @JsonKey(name: 'flavor_text')
  final String flavorText;
  final NamedAPIResource language;
  final NamedAPIResource version;

  FlavorText copyWith({
    String? flavorText,
    NamedAPIResource? language,
    NamedAPIResource? version,
  }) =>
      FlavorText(
        flavorText: flavorText ?? this.flavorText,
        language: language ?? this.language,
        version: version ?? this.version,
      );

  @override
  List<Object?> get props => [
        flavorText,
        language,
        version,
      ];
}
