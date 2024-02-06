import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/core/utils/Constant.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
part 'access_storge_cubit_state.dart';

class AccessStorgeCubitCubit extends Cubit<AccessStorgeCubitState> {
  AccessStorgeCubitCubit() : super(AccessStorgeCubitInitial());
  static AccessStorgeCubitCubit get(context) => BlocProvider.of(context);
  bool ChangeTheme = true;
  void ChangeThemeMethods() {
    ChangeTheme = !ChangeTheme;
    emit(AnyAction());
  }

  List<SongModel> songs = [];
  List<SongModel> Recentsongs = [];
  bool isLoading = false;
  final audioQuery = OnAudioQuery();
  Future<List<SongModel>> CheckPremissionToCollectSongsFromStorge() async {
    isLoading = true;
    var perm = await Permission.storage.request();
    if (perm.isGranted) {
      isLoading = true;
      emit(AccessStorgeLoading());
      songs = await audioQuery.querySongs(
        ignoreCase: true,
        orderType: OrderType.ASC_OR_SMALLER,
        sortType: null,
        uriType: UriType.EXTERNAL,
      );
      isLoading = false;
      emit(AccessStorgeDone());
      print(songs);
      print(songs.length);
      return songs;
    } else {
      return CheckPremissionToCollectSongsFromStorge();
    }
  }

  bool PLay = false;
  int CurruntOndexSongPLay = 0;
  changeValue(index) {
    CurruntOndexSongPLay = index;
    emit(PLaySong());
  }

  void isplayNowIsStopNow(SongModel song, context, newIndex) {
    PLay = !PLay;
    emit(AnyAction());
    PLay
        ? playSong(song, context, newIndex)
        : pauseSong(song, context, CurruntOndexSongPLay);
    emit(AnyAction());
  }

  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlay = false;
  void playSong(SongModel song, context, newIndex) async {
    PLay = true;
    isPlay = PLay;
    emit(PLaySong());
    await audioPlayer.setUrl(
      song.uri!,
    );
    CurruntOndexSongPLay = newIndex;
    Recentsongs.insert(0, song);
    CurruntOndexSongPLay = newIndex;
    await audioPlayer.play();
    emit(AnyAction());
  }

  bool loopOrNot = false;
  toggeleLoopOneSongOrAll(SongModel song) {
    loopOrNot = !loopOrNot;
    emit(AnyAction());
    if (loopOrNot) {
      return audioPlayer.setLoopMode(LoopMode.one);
    } else {
      return audioPlayer.setLoopMode(LoopMode.off);
    }
  }

  void pauseSong(SongModel song, context, index) async {
    index = CurruntOndexSongPLay;
    audioPlayer.pause();
    PLay = false;
    isPlay = PLay;
    isPlay = true;
    emit(PLaySong());
  }

  void reSong(SongModel song, context, index) async {
    index = CurruntOndexSongPLay;
    PLay = false;
    isPlay = PLay;
    isPlay = true;
    emit(PLaySong());
  }

//Formart Duration
  formatDuration(int milliseconds) {
    Duration duration = Duration(milliseconds: milliseconds);
    String formattedDuration =
        duration.inMinutes.remainder(60).toString().padLeft(2, '0') +
            ':' +
            duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    emit(AnyAction());
    return formattedDuration;
  }

  moveToAnotherItem(index, context, song, bool Next) {
    if (Next) {
      index++;
      CurruntOndexSongPLay = index;
      playSong(song, context, index);
      emit(AnyAction());
    } else {
      index--;
      CurruntOndexSongPLay = index;
      playSong(song, context, index);
      emit(AnyAction());
    }
  }

  isArapic() => Intl.getCurrentLocale() == "ar";

  bool isAarbicSelected = false;

  isValueArabic(value) {
    print(value);
    value == Constans.LangugeAr
        ? isAarbicSelected = true
        : isAarbicSelected = false;
    emit(AnyAction());
  }
}
