import 'package:animations/animations.dart';
import 'package:binge_watch/model/popular.dart';
import 'package:binge_watch/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class MovieCard extends StatelessWidget {
  final Item movie;
  final String category;
  final int id;

  const MovieCard(
      {Key key,
      @required this.movie,
      @required this.category,
      @required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => buildMovieCard(context),
        openBuilder: (context, action) =>
            DetailsScreen(movie: movie, id: id, category: category),
      ),
    );
  }

  Column buildMovieCard(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [kDefaultShadow],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(makePosterUrl(movie.poster)),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Text(
            movie.title,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow),
            SizedBox(width: kDefaultPadding / 2),
            Text(
              "${movie.cinemaReleaseDate}",
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        )
      ],
    );
  }
}
