// To parse this JSON data, do
//
//     final popular = popularFromMap(jsonString);

import 'dart:convert';

class Popular {
  Popular({
    this.totalResults,
    this.items,
  });

  int totalResults;
  List<Item> items;

  factory Popular.fromJson(String str) => Popular.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Popular.fromMap(Map<String, dynamic> json) => Popular(
        totalResults: json["total_results"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total_results": totalResults,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Item {
  Item({
    this.jwEntityId,
    this.id,
    this.title,
    this.fullPath,
    this.fullPaths,
    this.poster,
    this.objectType,
    this.localizedReleaseDate,
    this.cinemaReleaseDate,
  });

  String jwEntityId;
  int id;
  String title;
  String fullPath;
  FullPaths fullPaths;
  String poster;
  ObjectType objectType;
  DateTime localizedReleaseDate;
  DateTime cinemaReleaseDate;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        jwEntityId: json["jw_entity_id"],
        id: json["id"],
        title: json["title"],
        fullPath: json["full_path"],
        fullPaths: FullPaths.fromMap(json["full_paths"]),
        poster: json["poster"],
        objectType: objectTypeValues.map[json["object_type"]],
        localizedReleaseDate: json["localized_release_date"] == null
            ? null
            : DateTime.parse(json["localized_release_date"]),
        cinemaReleaseDate: json["cinema_release_date"] == null
            ? null
            : DateTime.parse(json["cinema_release_date"]),
      );

  Map<String, dynamic> toMap() => {
        "jw_entity_id": jwEntityId,
        "id": id,
        "title": title,
        "full_path": fullPath,
        "full_paths": fullPaths.toMap(),
        "poster": poster,
        "object_type": objectTypeValues.reverse[objectType],
        "localized_release_date": localizedReleaseDate == null
            ? null
            : "${localizedReleaseDate.year.toString().padLeft(4, '0')}-${localizedReleaseDate.month.toString().padLeft(2, '0')}-${localizedReleaseDate.day.toString().padLeft(2, '0')}",
        "cinema_release_date": cinemaReleaseDate == null
            ? null
            : "${cinemaReleaseDate.year.toString().padLeft(4, '0')}-${cinemaReleaseDate.month.toString().padLeft(2, '0')}-${cinemaReleaseDate.day.toString().padLeft(2, '0')}",
      };
}

class FullPaths {
  FullPaths({
    this.movieDetailOverview,
    this.showDetailOverview,
    this.movieDetailCinema,
  });

  String movieDetailOverview;
  String showDetailOverview;
  String movieDetailCinema;

  factory FullPaths.fromJson(String str) => FullPaths.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FullPaths.fromMap(Map<String, dynamic> json) => FullPaths(
        movieDetailOverview: json["MOVIE_DETAIL_OVERVIEW"] == null
            ? null
            : json["MOVIE_DETAIL_OVERVIEW"],
        showDetailOverview: json["SHOW_DETAIL_OVERVIEW"] == null
            ? null
            : json["SHOW_DETAIL_OVERVIEW"],
        movieDetailCinema: json["MOVIE_DETAIL_CINEMA"] == null
            ? null
            : json["MOVIE_DETAIL_CINEMA"],
      );

  Map<String, dynamic> toMap() => {
        "MOVIE_DETAIL_OVERVIEW":
            movieDetailOverview == null ? null : movieDetailOverview,
        "SHOW_DETAIL_OVERVIEW":
            showDetailOverview == null ? null : showDetailOverview,
        "MOVIE_DETAIL_CINEMA":
            movieDetailCinema == null ? null : movieDetailCinema,
      };
}

enum ObjectType { MOVIE, SHOW }

final objectTypeValues =
    EnumValues({"movie": ObjectType.MOVIE, "show": ObjectType.SHOW});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
