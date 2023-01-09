// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveName _$MoveNameFromJson(Map<String, dynamic> json) => MoveName(
      name: json['name'] as String,
      language:
          NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveNameToJson(MoveName instance) => <String, dynamic>{
      'name': instance.name,
      'language': instance.language.toJson(),
    };
