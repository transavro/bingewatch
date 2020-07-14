import 'package:binge_watch/components/genre_card.dart';
import 'package:binge_watch/model/jw_providers.dart';
import 'package:binge_watch/screens/home/components/movie_row.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:binge_watch/model/jw_genre.dart';

Future<ListView> makeGenreApiCall(JwProvider provider) async {
  print("#NAYAN making Genre api call");
  // making api
  var url = "https://apis.justwatch.com/content/genres/locale/en_IN";
  final _response = await http.get(url);

  //if 200 make list or send empty list
  if (_response.statusCode == 200) {
    print("#NAYAN Genre 200");
    //decode the json-string => dynamic list
    List<dynamic> result = convert.jsonDecode(_response.body);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: result.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final g = JwGenre.fromMap(result.elementAt(index));
        return MovieRow(genre: g, provider: provider);
      },
    );
  } else {
    print("#NAYAN not 200 Gnere");
    return ListView();
  }
}
