// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Species _$SpeciesFromJson(Map<String, dynamic> json) => Species(
      id: json['id'] as int,
      name: json['name'] as String,
      genderRate: json['gender_rate'] as int,
      evolutionChain:
          APIResource.fromJson(json['evolution_chain'] as Map<String, dynamic>),
      generation:
          NamedAPIResource.fromJson(json['generation'] as Map<String, dynamic>),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => FlavorText.fromJson(e as Map<String, dynamic>))
          .toList(),
      genera: (json['genera'] as List<dynamic>)
          .map((e) => SpeciesGenus.fromJson(e as Map<String, dynamic>))
          .toList(),
      order: json['order'] as int?,
      captureRate: json['capture_rate'] as int?,
    );

Map<String, dynamic> _$SpeciesToJson(Species instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'gender_rate': instance.genderRate,
      'capture_rate': instance.captureRate,
      'evolution_chain': instance.evolutionChain.toJson(),
      'generation': instance.generation.toJson(),
      'flavor_text_entries':
          instance.flavorTextEntries.map((e) => e.toJson()).toList(),
      'genera': instance.genera.map((e) => e.toJson()).toList(),
    };
