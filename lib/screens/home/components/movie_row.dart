import 'package:binge_watch/api/popular_api.dart';
import 'package:binge_watch/constants.dart';
import 'package:binge_watch/model/jw_genre.dart';
import 'package:binge_watch/model/jw_providers.dart';
import 'package:binge_watch/model/popular.dart';
import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

class MovieRow extends StatefulWidget {
  final JwGenre genre;
  final JwProvider provider;

  const MovieRow({Key key, this.genre, this.provider}) : super(key: key);

  @override
  _MovieRowState createState() => _MovieRowState();
}

class _MovieRowState extends State<MovieRow> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Map<String, String> headerMap = Map();
    Map<String, dynamic> bodyMap = Map();
    headerMap["Content-Type"] = "application/json";

    if (widget.provider != null)
      bodyMap["providers"] = [widget.provider.technicalName];

    if (widget.genre != null) bodyMap["genres"] = [widget.genre.technicalName];

    return FutureBuilder<Popular>(
      future: popularFetch(headerMap, bodyMap),
      builder: (context, snapshot) {
        return Transform(
          transform: Matrix4.identity()..translate(0.0, -80.0, 0.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 180,
              width: size.width,
              margin: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.genre.technicalName.capitalize(),
                      style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.w600, color: kTextColor),
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(width: 5),
                      itemCount: snapshot.data.items.length,
                      itemBuilder: (context, index) {
                        return _movieItem(
                            context, snapshot.data.items.elementAt(index));
                      },
                      padding: const EdgeInsets.only(left: 10, right: 20),
                      scrollDirection: Axis.horizontal,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _movieItem(BuildContext context, Item item) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) {
        //     return DetailPage(contentId, getIt<DetailPageServiceClient>());
        //   }),
        // );
      },
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.network(makePosterUrl(item.poster), fit: BoxFit.fill),
      ),
    );
  }
}
