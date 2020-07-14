import 'package:binge_watch/model/popular.dart';
import 'package:binge_watch/screens/details/components/body.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String category;
  final int id;
  final Item movie;

  const DetailsScreen(
      {Key key,
      @required this.category,
      @required this.id,
      @required this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(movie: movie, category: category, id: id),
    );
  }
}
