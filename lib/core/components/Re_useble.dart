import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../features/Featuers/presentation/Cubits/Access_storge_cubit_cubit/access_storge_cubit_cubit.dart';

Widget ItemSong(context, SongModel song, index) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: Container(
      child: InkWell(
        onTap: () {
          AccessStorgeCubitCubit.get(context).changeValue(index);
          AccessStorgeCubitCubit.get(context).playSong(song, context, index);
        },
        child: ListTile(
          trailing: AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay ==
                      index &&
                  AccessStorgeCubitCubit.get(context).isPlay != false
              ? AccessStorgeCubitCubit.get(context).PLay
                  ? SvgPicture.asset(
                      "lib/Assets/svg/sound.svg",
                      height: 25,
                      colorFilter: ColorFilter.mode(
                          Theme.of(context).iconTheme.color!, BlendMode.srcIn),

                      // color: Theme.of(context).iconTheme.color,
                    )
                  : Text("")
              : Text(""),
          leading: Container(
              child: QueryArtworkWidget(
                id: song.id,
                artworkFit: BoxFit.cover,
                artworkBorder: BorderRadius.circular(15),
                type: ArtworkType.AUDIO,
                nullArtworkWidget: Icon(
                  Icons.music_note,
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                    colors: [
                      Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.2),
                      Theme.of(context)
                          .colorScheme
                          .primaryContainer
                          .withOpacity(0.9)
                    ]),
              )),
          title: Text(
            "${song.title}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            "${song.artist}",
            style: Theme.of(context).textTheme.titleSmall!,
          ),
        ),
      ),
    ),
  );
}
