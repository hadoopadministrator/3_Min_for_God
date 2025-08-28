import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final AudioPlayer player = AudioPlayer();
  var isPlaying = false.obs;
  var currentSongPath = ''.obs;
  var currentCategory = ''.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;
  var isRepeatOn = false.obs;
  var hasSongPlayed = false.obs;

  @override
  void onInit() {
    super.onInit();
    // _player.play(AssetSource(widget.songPath));
    isPlaying.value = true;
    player.onDurationChanged.listen((d) {
      duration.value = d;
    });
    player.onPositionChanged.listen((p) {
      position.value = p;
    });
    player.onPlayerComplete.listen((event) async {
      if (isRepeatOn.value && currentSongPath.value.isNotEmpty) {
        await player.stop();
        await player.play(AssetSource(currentSongPath.value));
        isPlaying.value = true;
      } else {
        isPlaying.value = false;
        position.value = Duration.zero;
      }
    });
  }

  Future<void> play({required String songPath,String category = ""}) async {
    if (currentSongPath.value != songPath) {
      await player.stop();
      currentSongPath.value = songPath;
      if (category.isNotEmpty) {
      currentCategory.value = category; //  Save category
    }
      await player.play(AssetSource(songPath));
      isPlaying.value = true;
       hasSongPlayed.value = true; 
    } else {
      if (!isPlaying.value) {
        await player.resume();
        isPlaying.value = true;
      } else {
        await player.pause();
        isPlaying.value = false;
      }
    }
  }

  String _formatTime({required Duration d}) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  String getRemainingTime() {
    if (duration.value == Duration.zero) {
      return "--:--";
    } else if (position.value == Duration.zero && !isPlaying.value) {
      return "-${_formatTime(d: duration.value)}";
    } else {
      return "-${_formatTime(d: duration.value - position.value)}";
    }
  }

  void toggleRepeat() {
    isRepeatOn.value = !isRepeatOn.value;
  }

  Future<void> seek(Duration newPosition) async {
    await player.seek(newPosition);
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
