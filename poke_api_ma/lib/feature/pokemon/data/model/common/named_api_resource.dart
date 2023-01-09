import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'named_api_resource.g.dart';

@JsonSerializable(explicitToJson: true)
class NamedAPIResource extends Equatable {
  const NamedAPIResource({
    required this.name,
    required this.url,
  });

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) =>
      _$NamedAPIResourceFromJson(json);

  Map<String, dynamic> toJson() => _$NamedAPIResourceToJson(this);

  final String name;
  final String url;

  NamedAPIResource copyWith({
    String? name,
    String? url,
  }) =>
      NamedAPIResource(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  @override
  List<Object?> get props => [
        name,
        url,
      ];
}
