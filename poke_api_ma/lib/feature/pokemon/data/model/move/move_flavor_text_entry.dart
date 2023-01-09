import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'move_flavor_text_entry.g.dart';

@JsonSerializable(explicitToJson: true)
class MoveFlavorTextEntry extends Equatable {
  const MoveFlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.versionGroup,
  });
  factory MoveFlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$MoveFlavorTextEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MoveFlavorTextEntryToJson(this);

  @JsonKey(name: 'flavor_text')
  final String flavorText;

  final NamedAPIResource language;

  @JsonKey(name: 'version_group')
  final NamedAPIResource versionGroup;

  MoveFlavorTextEntry copyWith({
    String? flavorText,
    NamedAPIResource? language,
    NamedAPIResource? versionGroup,
  }) =>
      MoveFlavorTextEntry(
        flavorText: flavorText ?? this.flavorText,
        language: language ?? this.language,
        versionGroup: versionGroup ?? this.versionGroup,
      );

  @override
  List<Object?> get props => [
        flavorText,
        language,
        versionGroup,
      ];
}
