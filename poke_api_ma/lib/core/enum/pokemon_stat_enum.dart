enum PokemonStatEnum {
  hp(id: 1, name: 'hp', valueName: 'HP'),
  attack(id: 2, name: 'attack', valueName: 'Attack'),
  defense(id: 3, name: 'defense', valueName: 'Defense'),
  specialAttack(id: 4, name: 'special-attack', valueName: 'Sp. Atk'),
  specialDefense(id: 5, name: 'special-defense', valueName: 'Sp. Def'),
  speed(id: 6, name: 'speed', valueName: 'Speed'),
  accuracy(id: 7, name: 'accuracy', valueName: 'Accuracy'),
  evasion(id: 8, name: 'evasion', valueName: 'Evasion');

  const PokemonStatEnum({
    required this.id,
    required this.name,
    required this.valueName,
  });

  final int id;
  final String name;
  final String valueName;
}
