// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species_genus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpeciesGenus _$SpeciesGenusFromJson(Map<String, dynamic> json) => SpeciesGenus(
      genus: json['genus'] as String,
      language:
          NamedAPIResource.fromJson(json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpeciesGenusToJson(SpeciesGenus instance) =>
    <String, dynamic>{
      'genus': instance.genus,
      'language': instance.language.toJson(),
    };
