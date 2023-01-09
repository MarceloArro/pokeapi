// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_api_resource_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamedAPIResourceList _$NamedAPIResourceListFromJson(
        Map<String, dynamic> json) =>
    NamedAPIResourceList(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => NamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$NamedAPIResourceListToJson(
        NamedAPIResourceList instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
