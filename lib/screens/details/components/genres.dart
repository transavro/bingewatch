import 'package:binge_watch/components/genre_card.dart';
import 'package:binge_watch/model/jw_genre.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Genres extends StatelessWidget {
  final List<JwGenre> genreList;

  const Genres({Key key, this.genreList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: genreList.length,
          itemBuilder: (context, index) => GenreCard(
            genre: genreList.elementAt(index).technicalName,
          ),
        ),
      ),
    );
  }
}
