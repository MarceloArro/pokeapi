import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/common/named_api_resource.dart';
part 'named_api_resource_list.g.dart';

@JsonSerializable(explicitToJson: true)
class NamedAPIResourceList {
  NamedAPIResourceList({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  factory NamedAPIResourceList.fromJson(Map<String, dynamic> json) =>
      _$NamedAPIResourceListFromJson(json);

  Map<String, dynamic> toJson() => _$NamedAPIResourceListToJson(this);

  final int count;
  final String? next;
  final String? previous;
  final List<NamedAPIResource> results;

  NamedAPIResourceList copyWith({
    int? count,
    String? next,
    String? previous,
    List<NamedAPIResource>? results,
  }) =>
      NamedAPIResourceList(
        count: count ?? this.count,
        next: next ?? this.next,
        previous: previous ?? this.previous,
        results: results ?? this.results,
      );
}
