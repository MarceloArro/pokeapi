// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_version_group_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonVersionGroupDetail _$PokemonVersionGroupDetailFromJson(
        Map<String, dynamic> json) =>
    PokemonVersionGroupDetail(
      levelLearnedAt: json['level_learned_at'] as int,
      versionGroup: NamedAPIResource.fromJson(
          json['version_group'] as Map<String, dynamic>),
      moveLearnMethod: NamedAPIResource.fromJson(
          json['move_learn_method'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PokemonVersionGroupDetailToJson(
        PokemonVersionGroupDetail instance) =>
    <String, dynamic>{
      'level_learned_at': instance.levelLearnedAt,
      'version_group': instance.versionGroup.toJson(),
      'move_learn_method': instance.moveLearnMethod.toJson(),
    };
