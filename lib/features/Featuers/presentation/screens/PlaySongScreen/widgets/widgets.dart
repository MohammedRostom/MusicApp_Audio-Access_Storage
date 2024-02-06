import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/Methods/Methods.dart';
import '../../../../../../core/utils/Colors.dart';
import '../../../../../../core/utils/Constant.dart';
import '../../../../../../generated/l10n.dart';
import '../../../Cubits/Access_storge_cubit_cubit/access_storge_cubit_cubit.dart';
import '../methods/Play_song_methods.dart';

class BodyofSinglePlaySong extends StatelessWidget {
  const BodyofSinglePlaySong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: BlocConsumer<AccessStorgeCubitCubit, AccessStorgeCubitState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 470,
                  ),
                  SecoundSection(),
                  SizedBox(
                    height: 15,
                  ),
                  ThreeSection(),
                  SizedBox(
                    height: 25,
                  ),
                  FourSection(),
                  Spacer(),
                  FiveSection()
                ]),
          );
        },
      ),
    );
  }
}

class musicPatternBackground extends StatelessWidget {
  const musicPatternBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: AccessStorgeCubitCubit.get(context).ChangeTheme ? 0.05 : 0.08,
      child: Image(
          fit: BoxFit.fill,
          width: double.infinity,
          height: 800,
          image: AssetImage("${Constans.backGround2}")),
    );
  }
}

class FiveSection extends StatelessWidget {
  const FiveSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.transparent,
          ),
          Container(
              padding: EdgeInsets.all(8),
              clipBehavior: Clip.hardEdge,
              child: SvgPicture.asset(
                "${Constans.soundsvg}",
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              height: 49,
              width: 205,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      App_color.Slider_color.withOpacity(0.7),
                      App_color.Slider_color
                    ],
                  ))),
          SizedBox(
            width: 4,
          ),
          InkWell(
              onTap: () {
                PLaylistModelSheetSongs(
                  context,
                );
              },
              child: Icon(Icons.playlist_play)),
          // Container(
          //   width: 77,
          // ),
        ],
      ),
    );
  }

  PLaylistModelSheetSongs(
    BuildContext context,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('     ${S.of(context).Playlist}',
                          style: Theme.of(context).textTheme.labelMedium),
                      Icon(Icons.playlist_play)
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 349,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: List.generate(
                          AccessStorgeCubitCubit.get(context).songs.length,
                          (index) => ListTile(
                            leading: Icon(
                              Icons.music_note,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            title: Text(
                              '${AccessStorgeCubitCubit.get(context).songs[index].title}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            trailing: Text(
                              '${AccessStorgeCubitCubit.get(context).formatDuration(AccessStorgeCubitCubit.get(context).songs[index].duration!)}',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            onTap: () {
                              AccessStorgeCubitCubit.get(context).playSong(
                                  AccessStorgeCubitCubit.get(context)
                                      .songs[index],
                                  context,
                                  index);
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SecoundSection extends StatelessWidget {
  const SecoundSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Icon(
              Icons.share,
              size: Theme.of(context).iconTheme.size,
              color: Theme.of(context).iconTheme.color,
            ),
            Text(
              "${S.of(context).Share}",
              style: Theme.of(context).textTheme.titleSmall,
            )
          ],
        ),
        Column(
          children: [
            Text(
                "...${Play_song_methods().CurruntSong(context).title.length > 10 ? Play_song_methods().CurruntSong(context).title.substring(0, 15) : Play_song_methods().CurruntSong(context).title}",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 21)),
            Text(
              "${Play_song_methods().CurruntSong(context).artist}",
              style: Theme.of(context).textTheme.titleSmall!,
            )
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.keyboard_control,
              size: Theme.of(context).iconTheme.size,
            ),
            Text("${S.of(context).Menu}",
                style: Theme.of(context).textTheme.titleSmall)
          ],
        ),
      ],
    );
  }
}

class ThreeSection extends StatelessWidget {
  const ThreeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccessStorgeCubitCubit, AccessStorgeCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "00:00",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 228,
              child: Slider(
                value: 0.8,
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${Controller(context).formatDuration(Play_song_methods().CurruntSong(context).duration!)}",
              style: Theme.of(context).textTheme.titleSmall,
              // "${AccessStorgeCubitCubit.get(context).Posationtduration}",
            ),
          ],
        );
      },
    );
  }
}

class FourSection extends StatelessWidget {
  const FourSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccessStorgeCubitCubit, AccessStorgeCubitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 35,
                    height: 35,
                  ),
                  InkWell(
                    onTap: () => Play_song_methods().Pre_PLaySong(context),
                    child: Icon(
                      Controller(context).isArapic()
                          ? Icons.skip_next_rounded
                          : Icons.skip_previous_rounded,
                      size: 35,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                Controller(context).isplayNowIsStopNow(
                    Play_song_methods().CurruntSong(context),
                    context,
                    Controller(context).CurruntOndexSongPLay);
              },
              child: Icon(
                Controller(context).PLay
                    ? Icons.pause
                    : Icons.play_arrow_rounded,
                size: 53,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              width: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Play_song_methods().next_PLaySong(context),
                    child: Icon(
                      Controller(context).isArapic()
                          ? Icons.skip_previous_rounded
                          : Icons.skip_next_rounded,
                      size: 35,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Controller(context).toggeleLoopOneSongOrAll(
                          Play_song_methods().CurruntSong(context));
                    },
                    child: Icon(
                      Icons.repeat_one_rounded,
                      size: 30,
                      color: Controller(context).loopOrNot
                          ? Theme.of(context).iconTheme.color
                          : Theme.of(context).iconTheme.color!.withOpacity(0.4),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
