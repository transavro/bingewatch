import 'package:flutter/material.dart';

// Colos that use in our app
const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);
const imageBaseUrl = "https://images.justwatch.com";

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

String makePosterUrl(String imageEndPoint) {
  String image = imageEndPoint.replaceAll("{profile}", "s592/movie.webp");
  String result = imageBaseUrl + image;
  print("##########################NAYAN POSTER URl $result");
  return result;
}

String makeBackDropUrl(String imageEndPoint, String movieTitle) {
  String image =
      imageEndPoint.replaceAll("{profile}", "s1440/$movieTitle.webp");
  return imageBaseUrl + image;
}

// https://images.justwatch.com/icon/169478387/s100

String makeProviderUrl(String imageEndPoint) {
  String image = imageEndPoint.replaceAll("{profile}", "s100");
  return imageBaseUrl + image;
}
