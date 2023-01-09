import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'move_name.g.dart';

@JsonSerializable(explicitToJson: true)
class MoveName extends Equatable {
  const MoveName({
    required this.name,
    required this.language,
  });

  factory MoveName.fromJson(Map<String, dynamic> json) =>
      _$MoveNameFromJson(json);

  Map<String, dynamic> toJson() => _$MoveNameToJson(this);

  final String name;
  final NamedAPIResource language;

  MoveName copyWith({
    String? name,
    NamedAPIResource? language,
  }) =>
      MoveName(
        name: name ?? this.name,
        language: language ?? this.language,
      );

  @override
  List<Object?> get props => [
        name,
        language,
      ];
}
