import 'package:flutter/material.dart';
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
              musicPatternBackground(context),
              Image.asset("lib/Assets/HeroSectionOneSongPhoto.png"),
            ],
          ),
          BodyofSinglePlaySong(
            context,
          ),
        ],
      ),
    );
  }
}
