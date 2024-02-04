import 'package:flutter/material.dart';
import 'package:musicapp/core/components/Re_useble.dart';
import 'package:musicapp/core/utils/Colors.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../../../../../../config/routing/routing.dart';
import '../../../../../../core/utils/Constant.dart';
import '../../../Cubits/Access_storge_cubit_cubit/access_storge_cubit_cubit.dart';
import '../../PlaySongScreen/methods/Play_song_methods.dart';

Widget Body(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                child: Image.asset(
                  "lib/Assets/herosection.png",
                  fit: BoxFit.fill,
                ),
                height: 250,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'Recent',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 20),
              ),
              RecentBody(context),
              SizedBox(
                height: 12,
              ),
              Text(
                'Song Playlist',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 20),
              ),
              SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
        SongBody(context)
      ]),
    ),
  );
}

Widget RecentBody(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(
          AccessStorgeCubitCubit.get(context).Recentsongs.isEmpty
              ? Constans.StartREcentImage.length
              : AccessStorgeCubitCubit.get(context).Recentsongs.length,
          (index) => AccessStorgeCubitCubit.get(context).Recentsongs.isEmpty
              ? RecentItem(context,
                  Songrecent: Constans.StartREcentImage[index])
              : RecentItem(context,
                  Songrecent:
                      AccessStorgeCubitCubit.get(context).Recentsongs[index])),
    ),
  );
}

Padding RecentItem(BuildContext context, {required Songrecent}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8, bottom: 8, right: 8),
    child: Column(
      children: [
        Container(
            clipBehavior: Clip.hardEdge,
            child: AccessStorgeCubitCubit.get(context).Recentsongs.isEmpty
                ? Image.network(
                    "${Songrecent}",
                    fit: BoxFit.fill,
                  )
                : QueryArtworkWidget(
                    artworkBorder: BorderRadius.circular(15),
                    artworkFit: BoxFit.fill,
                    artworkHeight: 40,
                    id: Songrecent.id,
                    type: ArtworkType.AUDIO,
                    nullArtworkWidget: Icon(
                      Icons.music_note,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
            height: 70,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                  end: Alignment.topRight,
                  begin: Alignment.bottomLeft,
                  colors: [
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.4),
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.8)
                  ]),
            )),
        AccessStorgeCubitCubit.get(context).Recentsongs.isEmpty
            ? Text("")
            : Text(
                "... ${Songrecent.title.length > 10 ? Songrecent.title.substring(0, 10) : Songrecent.title}",
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall,
              )
      ],
    ),
  );
}

AppBar CutemAppBar(BuildContext context) {
  return AppBar(
    systemOverlayStyle: Theme.of(context).appBarTheme.systemOverlayStyle,
    leading: Icon(
      Icons.sort_sharp,
      color: Theme.of(context).appBarTheme.iconTheme?.color,
    ),
    titleTextStyle: Theme.of(context).appBarTheme!.titleTextStyle,
    title: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          "Memoic",
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(letterSpacing: 1.3),
        )),
    actions: [
      IconButton(
          onPressed: () {
            AccessStorgeCubitCubit.get(context).ChangeThemeMethods();
          },
          icon: Icon(AccessStorgeCubitCubit.get(context).ChangeTheme
              ? Icons.dark_mode_outlined
              : Icons.dark_mode)),
      IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
    ],
  );
}

Widget SongBody(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height - 258 * 2,
    child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: List.generate(
                AccessStorgeCubitCubit.get(context).songs.length,
                (index) => ItemSong(context,
                    AccessStorgeCubitCubit.get(context).songs[index], index)),
          ),
        ),
        AccessStorgeCubitCubit.get(context).isPlay
            ? CustemSnakbareApperPLaySong(context)
            : Text(""),
      ],
    ),
  );
}

Widget CustemSnakbareApperPLaySong(
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        Routeing.PlaySongScreen,
      );
    },
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: AnimatedContainer(
        duration: Duration(microseconds: 500),
        // ignore: sort_child_properties_last
        child: AccessStorgeCubitCubit.get(context).songs.isNotEmpty
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        border: Border.all(
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: App_color.Slider_color,
                            width: 3),
                        borderRadius: BorderRadius.circular(150)),
                    child: QueryArtworkWidget(
                      artworkBorder: BorderRadius.circular(15),
                      artworkFit: BoxFit.cover,
                      id: Play_song_methods().CurruntSong(context).id,
                      type: ArtworkType.AUDIO,
                      nullArtworkWidget: Icon(
                        Icons.music_note,
                        color: Theme.of(context).iconTheme.color,
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "...${AccessStorgeCubitCubit.get(context).songs[AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay].title.length > 15 ? AccessStorgeCubitCubit.get(context).songs[AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay].title.substring(0, 15) : AccessStorgeCubitCubit.get(context).songs[AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay].title}",
                            maxLines: 1,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "${AccessStorgeCubitCubit.get(context).formatDuration(AccessStorgeCubitCubit.get(context).songs[AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay].duration!)}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ApperPlay(
                    context,
                    AccessStorgeCubitCubit.get(context).CurruntOndexSongPLay,
                    song: Play_song_methods().CurruntSong(context),
                  )
                ],
              )
            : Text(""),
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                end: Alignment.topRight,
                begin: Alignment.bottomLeft,
                colors: [
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(1),
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(1),
                ]),
            borderRadius: BorderRadius.circular(150)),
      ),
    ),
  );
}

Widget ApperPlay(BuildContext context, index, {required SongModel song}) {
  return Container(
    child: Row(
      children: [
        GestureDetector(
          onTap: () => AccessStorgeCubitCubit.get(context)
              .isplayNowIsStopNow(song, context, index),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Icon(
              AccessStorgeCubitCubit.get(context).PLay
                  ? Icons.pause
                  : Icons.play_arrow,
              size: Theme.of(context).iconTheme.size,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: IconButton(
            onPressed: () => Play_song_methods().next_PLaySong(context),
            icon: Icon(
              Icons.skip_next_rounded,
              size: Theme.of(context).iconTheme.size,
              color: Theme.of(context).iconTheme.color,
            ),
          ),
        ),
      ],
    ),
  );
}
