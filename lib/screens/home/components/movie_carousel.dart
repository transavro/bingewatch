import 'package:binge_watch/api/popular_api.dart';
import 'package:binge_watch/model/popular.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

import '../../../constants.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  final Map<String, String> headerMap;
  final Map<String, dynamic> bodyMap;
  final Function() notifyTasteChanged;

  const MovieCarousel(
      {Key key, this.headerMap, this.bodyMap, this.notifyTasteChanged})
      : super(key: key);

  @override
  _MovieCarouselState createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      // so that we can have small portion shown on left and right side
      viewportFraction: 0.8,
      // by default our movie poster
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Popular>(
        future: popularFetch(widget.headerMap, widget.bodyMap),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
              child: AspectRatio(
                aspectRatio: 0.85,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        initialPage = value;
                      });
                    },
                    controller: _pageController,
                    physics: ClampingScrollPhysics(),
                    itemCount:
                        snapshot.data.items.length, // we have 3 demo movies
                    itemBuilder: (context, index) => buildMovieSlider(
                        index, snapshot.data.items.elementAt(index))),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget buildMovieSlider(int index, Item item) => AnimatedBuilder(
        animation: _pageController,
        builder: (context, child) {
          double value = 0;
          if (_pageController.position.haveDimensions) {
            value = index - _pageController.page;
            // We use 0.038 because 180*0.038 = 7 almost and we need to rotate our poster 7 degree
            // we use clamp so that our value vary from -1 to 1
            value = (value * 0.038).clamp(-1, 1);
          }
          return AnimatedOpacity(
            duration: Duration(milliseconds: 350),
            opacity: initialPage == index ? 1 : 0.4,
            child: Transform.rotate(
              angle: math.pi * value,
              child: MovieCard(
                movie: item,
                id: item.id,
                category: "movie",
              ),
            ),
          );
        },
      );
}
