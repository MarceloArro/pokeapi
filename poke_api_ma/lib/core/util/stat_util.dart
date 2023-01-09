int getPokemonLvl100MinStat({
  required int baseStat,
  bool isHP = false,
}) {
  if (isHP) {
    return baseStat * 2 + 110;
  }

  return ((5 + baseStat * 2) * 0.9).floor();
}

int getPokemonLvl100MaxStat({
  required int baseStat,
  bool isHP = false,
}) {
  if (isHP) {
    return (baseStat * 2 + 94) + 110;
  }
  return ((5 + 94 + baseStat * 2) * 1.1).floor();
}
