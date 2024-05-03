enum LuckyRouletteResults {
  none('reset'),
  fcl('fcl'),
  dash('dash'),
  sparky('sparky'),
  android('android');

  final String label;
  const LuckyRouletteResults(this.label);
}

enum LuckyRouletteState {
  none,
  spin,
  win,
}