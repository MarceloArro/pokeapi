// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveMeta _$MoveMetaFromJson(Map<String, dynamic> json) => MoveMeta(
      ailment:
          NamedAPIResource.fromJson(json['ailment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveMetaToJson(MoveMeta instance) => <String, dynamic>{
      'ailment': instance.ailment.toJson(),
    };
