import 'package:binge_watch/model/popular.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<Popular> popularFetch(
    Map<String, String> headerMap, Map<String, dynamic> bodyMap) async {
  var url = 'https://api.justwatch.com/content/titles/en_IN/popular';
  var mybody = convert.jsonEncode(bodyMap);

  final response = await http.post(
    url,
    headers: headerMap,
    body: mybody,
  );

  if (response.statusCode == 200) {
    print("WORKING POPULAR");
    return Popular.fromJson(response.body);
  } else {
    return null;
  }
}
