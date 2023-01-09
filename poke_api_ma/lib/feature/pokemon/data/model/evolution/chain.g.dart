// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chain _$ChainFromJson(Map<String, dynamic> json) => Chain(
      species:
          NamedAPIResource.fromJson(json['species'] as Map<String, dynamic>),
      evolvesTo: (json['evolves_to'] as List<dynamic>)
          .map((e) => Chain.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolutionDetails: (json['evolution_details'] as List<dynamic>?)
          ?.map((e) => EvolutionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      isBaby: json['is_baby'] as bool? ?? false,
    );

Map<String, dynamic> _$ChainToJson(Chain instance) => <String, dynamic>{
      'species': instance.species.toJson(),
      'evolution_details':
          instance.evolutionDetails?.map((e) => e.toJson()).toList(),
      'evolves_to': instance.evolvesTo.map((e) => e.toJson()).toList(),
      'is_baby': instance.isBaby,
    };
