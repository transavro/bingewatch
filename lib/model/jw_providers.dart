// To parse this JSON data, do
//
//     final jwProvider = jwProviderFromMap(jsonString);

import 'dart:convert';

class JwProvider {
  JwProvider({
    this.id,
    this.technicalName,
    this.shortName,
    this.clearName,
    this.priority,
    this.displayPriority,
    this.monetizationTypes,
    this.iconUrl,
    this.slug,
    this.data,
  });

  int id;
  String technicalName;
  String shortName;
  String clearName;
  int priority;
  int displayPriority;
  List<String> monetizationTypes;
  String iconUrl;
  String slug;
  Data data;

  factory JwProvider.fromJson(String str) =>
      JwProvider.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory JwProvider.fromMap(Map<String, dynamic> json) => JwProvider(
        id: json["id"],
        technicalName: json["technical_name"],
        shortName: json["short_name"],
        clearName: json["clear_name"],
        priority: json["priority"],
        displayPriority: json["display_priority"],
        monetizationTypes:
            List<String>.from(json["monetization_types"].map((x) => x)),
        iconUrl: json["icon_url"],
        slug: json["slug"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "technical_name": technicalName,
        "short_name": shortName,
        "clear_name": clearName,
        "priority": priority,
        "display_priority": displayPriority,
        "monetization_types":
            List<dynamic>.from(monetizationTypes.map((x) => x)),
        "icon_url": iconUrl,
        "slug": slug,
        "data": data.toMap(),
      };
}

class Data {
  Data({
    this.deeplinkData,
    this.packages,
  });

  List<DeeplinkDatum> deeplinkData;
  Packages packages;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        deeplinkData: List<DeeplinkDatum>.from(
            json["deeplink_data"].map((x) => DeeplinkDatum.fromMap(x))),
        packages: Packages.fromMap(json["packages"]),
      );

  Map<String, dynamic> toMap() => {
        "deeplink_data": List<dynamic>.from(deeplinkData.map((x) => x.toMap())),
        "packages": packages.toMap(),
      };
}

class DeeplinkDatum {
  DeeplinkDatum({
    this.scheme,
    this.packages,
    this.platforms,
    this.pathTemplate,
    this.extras,
  });

  Scheme scheme;
  List<String> packages;
  List<Platform> platforms;
  String pathTemplate;
  Extras extras;

  factory DeeplinkDatum.fromJson(String str) =>
      DeeplinkDatum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeeplinkDatum.fromMap(Map<String, dynamic> json) => DeeplinkDatum(
        scheme: schemeValues.map[json["scheme"]],
        packages: List<String>.from(json["packages"].map((x) => x)),
        platforms: List<Platform>.from(
            json["platforms"].map((x) => platformValues.map[x])),
        pathTemplate: json["path_template"],
        extras: json["extras"] == null ? null : Extras.fromMap(json["extras"]),
      );

  Map<String, dynamic> toMap() => {
        "scheme": schemeValues.reverse[scheme],
        "packages": List<dynamic>.from(packages.map((x) => x)),
        "platforms":
            List<dynamic>.from(platforms.map((x) => platformValues.reverse[x])),
        "path_template": pathTemplate,
        "extras": extras == null ? null : extras.toMap(),
      };
}

class Extras {
  Extras({
    this.sSource,
    this.sComAmazonIgnitionDeepLinkIntentDeepLink,
  });

  String sSource;
  String sComAmazonIgnitionDeepLinkIntentDeepLink;

  factory Extras.fromJson(String str) => Extras.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Extras.fromMap(Map<String, dynamic> json) => Extras(
        sSource: json["S.source"] == null ? null : json["S.source"],
        sComAmazonIgnitionDeepLinkIntentDeepLink:
            json["S.com.amazon.ignition.DeepLinkIntent.DEEP_LINK"] == null
                ? null
                : json["S.com.amazon.ignition.DeepLinkIntent.DEEP_LINK"],
      );

  Map<String, dynamic> toMap() => {
        "S.source": sSource == null ? null : sSource,
        "S.com.amazon.ignition.DeepLinkIntent.DEEP_LINK":
            sComAmazonIgnitionDeepLinkIntentDeepLink == null
                ? null
                : sComAmazonIgnitionDeepLinkIntentDeepLink,
      };
}

enum Platform { FIRE_TV, ANDROID_TV, TVOS }

final platformValues = EnumValues({
  "android_tv": Platform.ANDROID_TV,
  "fire_tv": Platform.FIRE_TV,
  "tvos": Platform.TVOS
});

enum Scheme { HTTPS, EMPTY }

final schemeValues = EnumValues({"": Scheme.EMPTY, "https": Scheme.HTTPS});

class Packages {
  Packages({
    this.androidTv,
    this.fireTv,
    this.tvos,
  });

  String androidTv;
  String fireTv;
  String tvos;

  factory Packages.fromJson(String str) => Packages.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Packages.fromMap(Map<String, dynamic> json) => Packages(
        androidTv: json["android_tv"],
        fireTv: json["fire_tv"],
        tvos: json["tvos"],
      );

  Map<String, dynamic> toMap() => {
        "android_tv": androidTv,
        "fire_tv": fireTv,
        "tvos": tvos,
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
