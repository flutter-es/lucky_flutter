enum LuckyRouletteResults {
  fcl('fcl'),
  android('android'),
  sparky('sparky'),
  dash('dash'),
  none('reset');

  final String label;
  const LuckyRouletteResults(this.label);
}

enum LuckyRouletteState {
  none,
  spin,
  win,
}

enum LuckyRouletteSounds {
  clank,
  coinsfalling,
  result,
  spin,
}