import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:lucky_flutter/helpers/enums.dart';

class SoundNotificationService {

  Map<LuckyRouletteSounds, AudioPlayer> players = {};
  Map<LuckyRouletteSounds, AssetSource> assetSoundSources = {};
  final soloud = SoLoud.instance;
  late AudioSource source;
  late SoundHandle handle;

  Future<void> initializeSounds() async {
    await soloud.init();
  }

  Future<void> playSound(LuckyRouletteSounds sound) async {
    source = await soloud.loadAsset('./assets/sounds/${sound.name}.mp3');
    await soloud.play(source);
  }

  Future<void> stopAllSounds() async {
    // for(var element in players.values) {
    //   await element.stop();
    // }
  }
}