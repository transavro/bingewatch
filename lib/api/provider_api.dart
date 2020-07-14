import 'package:binge_watch/components/provider_card.dart';
import 'package:binge_watch/model/jw_providers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

Future<ListView> makeProviderApiCall() async {
  // making api
  var url = "https://apis.justwatch.com/content/providers/locale/en_IN";
  // making http ge api call
  final _response = await http.get(url);

  //if 200 make list or send empty list
  if (_response.statusCode == 200) {
    //decode the json-string => dynamic list

    List<dynamic> result = convert.jsonDecode(_response.body);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: result.length,
      itemBuilder: (context, index) {
        final g = JwProvider.fromMap(result.elementAt(index));
        return ProviderCard(provider: g.iconUrl);
      },
    );
  } else {
    return ListView();
  }
}
