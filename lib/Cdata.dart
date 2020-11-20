import 'dart:convert';

List<Cdata> cdataFromJson(String str) => List<Cdata>.from(json.decode(str).map((x) => Cdata.fromJson(x)));

String cdataToJson(List<Cdata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cdata {
  Cdata({
    this.id,
    this.attributes,
    this.deviceId,
    this.type,
    this.protocol,
    this.serverTime,
    this.deviceTime,
    this.fixTime,
    this.outdated,
    this.valid,
    this.latitude,
    this.longitude,
    this.altitude,
    this.speed,
    this.course,
    this.address,
    this.accuracy,
    this.network,
  });

  int id;
  Attributes attributes;
  int deviceId;
  dynamic type;
  Protocol protocol;
  String serverTime;
  String deviceTime;
  String fixTime;
  bool outdated;
  bool valid;
  double latitude;
  double longitude;
  double altitude;
  double speed;
  double course;
  dynamic address;
  double accuracy;
  dynamic network;

  factory Cdata.fromJson(Map<String, dynamic> json) => Cdata(
    id: json["id"],
    attributes: Attributes.fromJson(json["attributes"]),
    deviceId: json["deviceId"],
    type: json["type"],
    protocol: protocolValues.map[json["protocol"]],
    serverTime: json["serverTime"],
    deviceTime: json["deviceTime"],
    fixTime: json["fixTime"],
    outdated: json["outdated"],
    valid: json["valid"],
    latitude: json["latitude"].toDouble(),
    longitude: json["longitude"].toDouble(),
    altitude: json["altitude"].toDouble(),
    speed: json["speed"].toDouble(),
    course: json["course"].toDouble(),
    address: json["address"],
    accuracy: json["accuracy"].toDouble(),
    network: json["network"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "attributes": attributes.toJson(),
    "deviceId": deviceId,
    "type": type,
    "protocol": protocolValues.reverse[protocol],
    "serverTime": serverTime,
    "deviceTime": deviceTime,
    "fixTime": fixTime,
    "outdated": outdated,
    "valid": valid,
    "latitude": latitude,
    "longitude": longitude,
    "altitude": altitude,
    "speed": speed,
    "course": course,
    "address": address,
    "accuracy": accuracy,
    "network": network,
  };
}

class Attributes {
  Attributes({
    this.batteryLevel,
    this.distance,
    this.totalDistance,
    this.motion,
  });

  double batteryLevel;
  double distance;
  double totalDistance;
  bool motion;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
    batteryLevel: json["batteryLevel"].toDouble(),
    distance: json["distance"].toDouble(),
    totalDistance: json["totalDistance"].toDouble(),
    motion: json["motion"],
  );

  Map<String, dynamic> toJson() => {
    "batteryLevel": batteryLevel,
    "distance": distance,
    "totalDistance": totalDistance,
    "motion": motion,
  };
}

enum Protocol { OSMAND }

final protocolValues = EnumValues({
  "osmand": Protocol.OSMAND
});

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