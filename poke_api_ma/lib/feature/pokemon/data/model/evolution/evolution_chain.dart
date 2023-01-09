import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:poke_api_ma/feature/pokemon/data/model/evolution/chain.dart';

part 'evolution_chain.g.dart';

@JsonSerializable(explicitToJson: true)
class EvolutionChain extends Equatable {
  const EvolutionChain({
    required this.id,
    required this.chain,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);
  final int id;
  final Chain chain;

  EvolutionChain copyWith({
    int? id,
    Chain? chain,
  }) =>
      EvolutionChain(
        id: id ?? this.id,
        chain: chain ?? this.chain,
      );

  @override
  List<Object?> get props => [
        id,
        chain,
      ];
}
