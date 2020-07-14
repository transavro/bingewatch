import 'package:binge_watch/model/jw_movie_detail.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'cast_card.dart';

class CastAndCrew extends StatelessWidget {
  final List<Credit> casts;

  const CastAndCrew({Key key, this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Cast & Crew",
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: kDefaultPadding),
          SizedBox(
            height: 160,
            child: _buildCast(casts),
          )
        ],
      ),
    );
  }

  ListView _buildCast(List<Credit> casts) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: casts.length,
      itemBuilder: (context, index) {
        Map castMap = Map();
        castMap["orginalName"] = casts[index].name;
        castMap["movieName"] = casts[index].characterName;
        return CastCard(cast: castMap);
      },
    );
  }
}
