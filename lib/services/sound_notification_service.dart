import 'package:audioplayers/audioplayers.dart';
import 'package:lucky_flutter/helpers/enums.dart';

class SoundNotificationService {

  Map<LuckyRouletteSounds, AudioPlayer> players = {};
  Map<LuckyRouletteSounds, AssetSource> assetSoundSources = {};

  Future<void> initializeSounds() async {
    AudioPlayer clank = AudioPlayer();
    AudioPlayer coinsfalling = AudioPlayer();
    AudioPlayer result = AudioPlayer();
    AudioPlayer spin = AudioPlayer();

    players = { 
      LuckyRouletteSounds.clank: clank,
      LuckyRouletteSounds.coinsfalling: coinsfalling,
      LuckyRouletteSounds.result: result,
      LuckyRouletteSounds.spin: spin,
    };

    for(var sound in LuckyRouletteSounds.values) {
      assetSoundSources[sound] = AssetSource('sounds/${sound.name}.mp3');
      players[sound]!.setSource(assetSoundSources[sound]!);
    }
  }

  Future<void> playSound(LuckyRouletteSounds sound) async {

    await players[sound]!.play(assetSoundSources[sound]!);
  }

  Future<void> stopAllSounds() async {
    for(var element in players.values) {
      await element.stop();
    }
  }
}