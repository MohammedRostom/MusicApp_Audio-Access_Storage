import 'package:flutter/material.dart';
import '../../../../../core/utils/Constant.dart';
import 'widgets/widgets.dart';

class PlaySong extends StatelessWidget {
  const PlaySong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              musicPatternBackground(),
              Image.asset("${Constans.HeroSectionOneSongPhoto}"),
            ],
          ),
          BodyofSinglePlaySong(),
        ],
      ),
    );
  }
}
