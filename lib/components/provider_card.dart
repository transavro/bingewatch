import 'package:flutter/material.dart';

import '../constants.dart';

class ProviderCard extends StatelessWidget {
  final String provider;

  const ProviderCard({Key key, this.provider}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(left: kDefaultPadding),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(makeProviderUrl(provider)),
        ),
      ),
    );
  }
}
