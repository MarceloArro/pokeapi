import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'move_meta.g.dart';

@JsonSerializable(explicitToJson: true)
class MoveMeta extends Equatable {
  const MoveMeta({
    required this.ailment,
  });

  factory MoveMeta.fromJson(Map<String, dynamic> json) =>
      _$MoveMetaFromJson(json);

  Map<String, dynamic> toJson() => _$MoveMetaToJson(this);

  final NamedAPIResource ailment;

  MoveMeta copyWith({
    NamedAPIResource? ailment,
  }) =>
      MoveMeta(
        ailment: ailment ?? this.ailment,
      );

  @override
  List<Object?> get props => [
        ailment,
      ];
}
