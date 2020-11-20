import 'dart:convert';

UserGeo userGeoFromJson(String str) => UserGeo.fromJson(json.decode(str));

String userGeoToJson(UserGeo data) => json.encode(data.toJson());

class UserGeo {
  UserGeo({
    this.id,
    this.attributes,
    this.name,
    this.login,
    this.email,
    this.phone,
    this.readonly,
    this.administrator,
    this.map,
    this.latitude,
    this.longitude,
    this.zoom,
    this.twelveHourFormat,
    this.coordinateFormat,
    this.disabled,
    this.expirationTime,
    this.deviceLimit,
    this.userLimit,
    this.deviceReadonly,
    this.token,
    this.limitCommands,
    this.poiLayer,
    this.password,
  });

  int id;
  Attributes attributes;
  String name;
  dynamic login;
  String email;
  dynamic phone;
  bool readonly;
  bool administrator;
  dynamic map;
  double latitude;
  double longitude;
  int zoom;
  bool twelveHourFormat;
  dynamic coordinateFormat;
  bool disabled;
  dynamic expirationTime;
  int deviceLimit;
  int userLimit;
  bool deviceReadonly;
  dynamic token;
  bool limitCommands;
  dynamic poiLayer;
  dynamic password;

  factory UserGeo.fromJson(Map<String, dynamic> json) => UserGeo(
        id: json["id"],
        attributes: Attributes.fromJson(json["attributes"]),
        name: json["name"],
        login: json["login"],
        email: json["email"],
        phone: json["phone"],
        readonly: json["readonly"],
        administrator: json["administrator"],
        map: json["map"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        zoom: json["zoom"],
        twelveHourFormat: json["twelveHourFormat"],
        coordinateFormat: json["coordinateFormat"],
        disabled: json["disabled"],
        expirationTime: json["expirationTime"],
        deviceLimit: json["deviceLimit"],
        userLimit: json["userLimit"],
        deviceReadonly: json["deviceReadonly"],
        token: json["token"],
        limitCommands: json["limitCommands"],
        poiLayer: json["poiLayer"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
        "name": name,
        "login": login,
        "email": email,
        "phone": phone,
        "readonly": readonly,
        "administrator": administrator,
        "map": map,
        "latitude": latitude,
        "longitude": longitude,
        "zoom": zoom,
        "twelveHourFormat": twelveHourFormat,
        "coordinateFormat": coordinateFormat,
        "disabled": disabled,
        "expirationTime": expirationTime,
        "deviceLimit": deviceLimit,
        "userLimit": userLimit,
        "deviceReadonly": deviceReadonly,
        "token": token,
        "limitCommands": limitCommands,
        "poiLayer": poiLayer,
        "password": password,
      };
}

class Attributes {
  Attributes();

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes();

  Map<String, dynamic> toJson() => {};
}
