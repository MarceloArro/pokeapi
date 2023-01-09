import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_resource.g.dart';

@JsonSerializable(explicitToJson: true)
class APIResource extends Equatable {
  const APIResource({
    required this.url,
  });

  factory APIResource.fromJson(Map<String, dynamic> json) =>
      _$APIResourceFromJson(json);

  Map<String, dynamic> toJson() => _$APIResourceToJson(this);

  final String url;

  APIResource copyWith({
    String? url,
  }) =>
      APIResource(
        url: url ?? this.url,
      );

  @override
  List<Object?> get props => [
        url,
      ];
}
