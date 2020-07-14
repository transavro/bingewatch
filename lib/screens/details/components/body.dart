import 'package:binge_watch/api/movie_detail_api.dart';
import 'package:binge_watch/model/jw_movie_detail.dart';
import 'package:binge_watch/model/popular.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'backdrop_rating.dart';
import 'cast_and_crew.dart';
import 'title_duration_and_fav_btn.dart';

class Body extends StatelessWidget {
  final String category;
  final int id;
  final Item movie;

  const Body({Key key, this.category, this.id, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // it will provide us total height and width
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<JwMovieDetail>(
        future: fetchMovieDetailCall(category, id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BackdropAndRating(size: size, movieDetails: snapshot.data),
                  SizedBox(height: kDefaultPadding / 2),
                  TitleDurationAndFabBtn(movie: snapshot.data),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      snapshot.data.shortDescription,
                      maxLines: 3,
                      style: TextStyle(
                        color: Color(0xFF737599),
                      ),
                    ),
                  ),
                  CastAndCrew(casts: snapshot.data.credits),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
