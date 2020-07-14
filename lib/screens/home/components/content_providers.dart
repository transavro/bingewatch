import 'package:binge_watch/api/provider_api.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ContentProviders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: makeProviderApiCall(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: 76,
              child: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
