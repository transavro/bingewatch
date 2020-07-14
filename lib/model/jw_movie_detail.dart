// To parse this JSON data, do
//
//     final jwMovieDetail = jwMovieDetailFromMap(jsonString);

import 'dart:convert';

class JwMovieDetail {
  JwMovieDetail({
    this.jwEntityId,
    this.id,
    this.title,
    this.fullPath,
    this.fullPaths,
    this.poster,
    this.backdrops,
    this.shortDescription,
    this.originalReleaseYear,
    this.tmdbPopularity,
    this.objectType,
    this.originalTitle,
    this.offers,
    this.clips,
    this.scoring,
    this.credits,
    this.externalIds,
    this.genreIds,
    this.ageCertification,
    this.runtime,
  });

  String jwEntityId;
  int id;
  String title;
  String fullPath;
  FullPaths fullPaths;
  String poster;
  List<Backdrop> backdrops;
  String shortDescription;
  int originalReleaseYear;
  double tmdbPopularity;
  String objectType;
  String originalTitle;
  List<Offer> offers;
  List<Clip> clips;
  List<Scoring> scoring;
  List<Credit> credits;
  List<ExternalId> externalIds;
  List<int> genreIds;
  String ageCertification;
  int runtime;

  factory JwMovieDetail.fromJson(String str) =>
      JwMovieDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JwMovieDetail.fromMap(Map<String, dynamic> json) => JwMovieDetail(
        jwEntityId: json["jw_entity_id"],
        id: json["id"],
        title: json["title"],
        fullPath: json["full_path"],
        fullPaths: FullPaths.fromMap(json["full_paths"]),
        poster: json["poster"],
        backdrops: List<Backdrop>.from(
            json["backdrops"].map((x) => Backdrop.fromMap(x))),
        shortDescription: json["short_description"],
        originalReleaseYear: json["original_release_year"],
        tmdbPopularity: json["tmdb_popularity"].toDouble(),
        objectType: json["object_type"],
        originalTitle: json["original_title"],
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromMap(x))),
        clips: List<Clip>.from(json["clips"].map((x) => Clip.fromMap(x))),
        scoring:
            List<Scoring>.from(json["scoring"].map((x) => Scoring.fromMap(x))),
        credits:
            List<Credit>.from(json["credits"].map((x) => Credit.fromMap(x))),
        externalIds: List<ExternalId>.from(
            json["external_ids"].map((x) => ExternalId.fromMap(x))),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        ageCertification: json["age_certification"],
        runtime: json["runtime"],
      );

  Map<String, dynamic> toMap() => {
        "jw_entity_id": jwEntityId,
        "id": id,
        "title": title,
        "full_path": fullPath,
        "full_paths": fullPaths.toMap(),
        "poster": poster,
        "backdrops": List<dynamic>.from(backdrops.map((x) => x.toMap())),
        "short_description": shortDescription,
        "original_release_year": originalReleaseYear,
        "tmdb_popularity": tmdbPopularity,
        "object_type": objectType,
        "original_title": originalTitle,
        "offers": List<dynamic>.from(offers.map((x) => x.toMap())),
        "clips": List<dynamic>.from(clips.map((x) => x.toMap())),
        "scoring": List<dynamic>.from(scoring.map((x) => x.toMap())),
        "credits": List<dynamic>.from(credits.map((x) => x.toMap())),
        "external_ids": List<dynamic>.from(externalIds.map((x) => x.toMap())),
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "age_certification": ageCertification,
        "runtime": runtime,
      };
}

class Backdrop {
  Backdrop({
    this.backdropUrl,
  });

  String backdropUrl;

  factory Backdrop.fromJson(String str) => Backdrop.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Backdrop.fromMap(Map<String, dynamic> json) => Backdrop(
        backdropUrl: json["backdrop_url"],
      );

  Map<String, dynamic> toMap() => {
        "backdrop_url": backdropUrl,
      };
}

class Clip {
  Clip({
    this.type,
    this.provider,
    this.externalId,
    this.name,
  });

  Type type;
  Provider provider;
  String externalId;
  String name;

  factory Clip.fromJson(String str) => Clip.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clip.fromMap(Map<String, dynamic> json) => Clip(
        type: typeValues.map[json["type"]],
        provider: providerValues.map[json["provider"]],
        externalId: json["external_id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "type": typeValues.reverse[type],
        "provider": providerValues.reverse[provider],
        "external_id": externalId,
        "name": name,
      };
}

enum Provider { YOUTUBE }

final providerValues = EnumValues({"youtube": Provider.YOUTUBE});

enum Type { TRAILER, FEATURETTE, TEASER }

final typeValues = EnumValues({
  "featurette": Type.FEATURETTE,
  "teaser": Type.TEASER,
  "trailer": Type.TRAILER
});

class Credit {
  Credit({
    this.role,
    this.characterName,
    this.personId,
    this.name,
  });

  Role role;
  String characterName;
  int personId;
  String name;

  factory Credit.fromJson(String str) => Credit.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Credit.fromMap(Map<String, dynamic> json) => Credit(
        role: roleValues.map[json["role"]],
        characterName:
            json["character_name"] == null ? null : json["character_name"],
        personId: json["person_id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "role": roleValues.reverse[role],
        "character_name": characterName == null ? null : characterName,
        "person_id": personId,
        "name": name,
      };
}

enum Role {
  ACTOR,
  ASSISTANT_DIRECTOR,
  DIRECTOR,
  EDITOR,
  EXECUTIVE_PRODUCER,
  ORIGINAL_MUSIC_COMPOSER,
  PRODUCER,
  PRODUCTION_DESIGN,
  SCREENPLAY,
  VISUAL_EFFECTS
}

final roleValues = EnumValues({
  "ACTOR": Role.ACTOR,
  "ASSISTANT_DIRECTOR": Role.ASSISTANT_DIRECTOR,
  "DIRECTOR": Role.DIRECTOR,
  "EDITOR": Role.EDITOR,
  "EXECUTIVE_PRODUCER": Role.EXECUTIVE_PRODUCER,
  "ORIGINAL_MUSIC_COMPOSER": Role.ORIGINAL_MUSIC_COMPOSER,
  "PRODUCER": Role.PRODUCER,
  "PRODUCTION_DESIGN": Role.PRODUCTION_DESIGN,
  "SCREENPLAY": Role.SCREENPLAY,
  "VISUAL_EFFECTS": Role.VISUAL_EFFECTS
});

class ExternalId {
  ExternalId({
    this.provider,
    this.externalId,
  });

  String provider;
  String externalId;

  factory ExternalId.fromJson(String str) =>
      ExternalId.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExternalId.fromMap(Map<String, dynamic> json) => ExternalId(
        provider: json["provider"],
        externalId: json["external_id"],
      );

  Map<String, dynamic> toMap() => {
        "provider": provider,
        "external_id": externalId,
      };
}

class FullPaths {
  FullPaths({
    this.movieDetailOverview,
  });

  String movieDetailOverview;

  factory FullPaths.fromJson(String str) => FullPaths.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FullPaths.fromMap(Map<String, dynamic> json) => FullPaths(
        movieDetailOverview: json["MOVIE_DETAIL_OVERVIEW"],
      );

  Map<String, dynamic> toMap() => {
        "MOVIE_DETAIL_OVERVIEW": movieDetailOverview,
      };
}

class Offer {
  Offer({
    this.monetizationType,
    this.providerId,
    this.currency,
    this.urls,
    this.presentationType,
    this.retailPrice,
  });

  MonetizationType monetizationType;
  int providerId;
  Currency currency;
  Urls urls;
  PresentationType presentationType;
  int retailPrice;

  factory Offer.fromJson(String str) => Offer.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Offer.fromMap(Map<String, dynamic> json) => Offer(
        monetizationType: monetizationTypeValues.map[json["monetization_type"]],
        providerId: json["provider_id"],
        currency: currencyValues.map[json["currency"]],
        urls: Urls.fromMap(json["urls"]),
        presentationType: presentationTypeValues.map[json["presentation_type"]],
        retailPrice: json["retail_price"] == null ? null : json["retail_price"],
      );

  Map<String, dynamic> toMap() => {
        "monetization_type": monetizationTypeValues.reverse[monetizationType],
        "provider_id": providerId,
        "currency": currencyValues.reverse[currency],
        "urls": urls.toMap(),
        "presentation_type": presentationTypeValues.reverse[presentationType],
        "retail_price": retailPrice == null ? null : retailPrice,
      };
}

enum Currency { INR }

final currencyValues = EnumValues({"INR": Currency.INR});

enum MonetizationType { FLATRATE, BUY, RENT }

final monetizationTypeValues = EnumValues({
  "buy": MonetizationType.BUY,
  "flatrate": MonetizationType.FLATRATE,
  "rent": MonetizationType.RENT
});

enum PresentationType { SD, HD }

final presentationTypeValues =
    EnumValues({"hd": PresentationType.HD, "sd": PresentationType.SD});

class Urls {
  Urls({
    this.standardWeb,
    this.deeplinkAndroidTv,
  });

  String standardWeb;
  String deeplinkAndroidTv;

  factory Urls.fromJson(String str) => Urls.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
        standardWeb: json["standard_web"],
        deeplinkAndroidTv: json["deeplink_android_tv"] == null
            ? null
            : json["deeplink_android_tv"],
      );

  Map<String, dynamic> toMap() => {
        "standard_web": standardWeb,
        "deeplink_android_tv":
            deeplinkAndroidTv == null ? null : deeplinkAndroidTv,
      };
}

class Scoring {
  Scoring({
    this.providerType,
    this.value,
  });

  String providerType;
  double value;

  factory Scoring.fromJson(String str) => Scoring.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Scoring.fromMap(Map<String, dynamic> json) => Scoring(
        providerType: json["provider_type"],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "provider_type": providerType,
        "value": value,
      };
}

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
