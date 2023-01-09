import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';

part 'description.g.dart';

@JsonSerializable(explicitToJson: true)
class Description extends Equatable {
  const Description({
    required this.description,
    required this.language,
  });
  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);

  final String description;
  final NamedAPIResource language;

  Description copyWith({
    String? description,
    NamedAPIResource? language,
  }) =>
      Description(
        description: description ?? this.description,
        language: language ?? this.language,
      );

  @override
  List<Object?> get props => [
        description,
        language,
      ];
}
