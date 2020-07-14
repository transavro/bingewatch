import 'package:binge_watch/constants.dart';
import 'package:binge_watch/screens/home/components/content_providers.dart';
import 'package:binge_watch/screens/home/components/genres.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  final Map<String, String> headerMap = Map();
  final Map<String, dynamic> bodyMap = Map();
  Function onChangePrefs;

  @override
  Widget build(BuildContext context) {
    // it enable scroll on small device

    headerMap["Content-Type"] = "application/json";
    bodyMap["providers"] = ["hotstar"];

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          // Categorylist(notifyCategoryChanged: onChangePrefs),
          // ContentProviders(),
          // SizedBox(height: kDefaultPadding),
          Genres(),

          // MovieCarousel(
          //   headerMap: headerMap,
          //   bodyMap: bodyMap,
          //   notifyTasteChanged: onChangePrefs,
          // ),
        ],
      ),
    );
  }
}
