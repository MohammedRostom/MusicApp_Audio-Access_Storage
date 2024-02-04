import 'package:flutter/material.dart';
import '../../features/Featuers/presentation/screens/MusicListScreen/MusicListScreen.dart';
import '../../features/Featuers/presentation/screens/PlaySongScreen/PlaySongScreen.dart';

class Routeing {
  static final SplashScreen = "SplashScreen";
  static final MusicListScreen = "MusicListScreen";
  static final PlaySongScreen = "PlaySongScreen";

  static Map<String, Widget Function(BuildContext)> MapOfAppRoutes = {
    MusicListScreen: (context) => MusicList(),
    PlaySongScreen: (context) => PlaySong(),
  };
}
