// To parse this JSON data, do
//
//     final jwGenre = jwGenreFromMap(jsonString);

import 'dart:convert';

class JwGenre {
  JwGenre({
    this.id,
    this.shortName,
    this.technicalName,
    this.translation,
    this.slug,
  });

  int id;
  String shortName;
  String technicalName;
  String translation;
  String slug;

  factory JwGenre.fromJson(String str) => JwGenre.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JwGenre.fromMap(Map<String, dynamic> json) => JwGenre(
        id: json["id"],
        shortName: json["short_name"],
        technicalName: json["technical_name"],
        translation: json["translation"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "short_name": shortName,
        "technical_name": technicalName,
        "translation": translation,
        "slug": slug,
      };
}
