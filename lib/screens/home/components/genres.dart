import 'package:binge_watch/api/genre_api.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Genres extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: makeGenreApiCall(null),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              child: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
