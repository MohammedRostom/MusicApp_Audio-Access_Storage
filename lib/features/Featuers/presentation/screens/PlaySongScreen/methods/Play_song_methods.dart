import 'package:flutter/material.dart';
import '../../../Cubits/Access_storge_cubit_cubit/access_storge_cubit_cubit.dart';

class Play_song_methods {
  CurruntSong(BuildContext context) {
    return AccessStorgeCubitCubit.get(context)
        .songs[AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay];
  }

  Pre_PLaySong(context) {
    AccessStorgeCubitCubit.get(context).moveToAnotherItem(
        AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay,
        context,
        AccessStorgeCubitCubit.get(context).songs[
            AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay - 1],
        false);
  }

  next_PLaySong(context) {
    AccessStorgeCubitCubit.get(context).moveToAnotherItem(
        AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay,
        context,
        AccessStorgeCubitCubit.get(context).songs[
            AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay + 1],
        true);
  }
}
