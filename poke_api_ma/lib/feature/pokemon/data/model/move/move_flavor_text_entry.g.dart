// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_flavor_text_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFlavorTextEntry _$MoveFlavorTextEntryFromJson(Map<String, dynamic> json) =>
    MoveFlavorTextEntry(
      flavorText: json['flavor_text'] as String,
      language:
          NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
      versionGroup: NamedAPIResource.fromJson(
          json['version_group'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoveFlavorTextEntryToJson(
        MoveFlavorTextEntry instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language.toJson(),
      'version_group': instance.versionGroup.toJson(),
    };
