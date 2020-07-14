import 'package:binge_watch/model/jw_movie_detail.dart';
import 'package:http/http.dart' as http;

Future<JwMovieDetail> fetchMovieDetailCall(String category, int id) async {
  // making api
  var url =
      "https://apis.justwatch.com/content/titles/$category/$id/locale/en_IN";
  print("###########NAYAN $url");
  final _response = await http.get(url);
  print("###########NAYAN Api call made  ${_response.statusCode}");
  //if 200 make list or send empty list
  if (_response.statusCode == 200) {
    return JwMovieDetail.fromJson(_response.body);
  } else {
    return null;
  }
}
