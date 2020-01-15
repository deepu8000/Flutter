import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'appconfig.g.dart';

@JsonSerializable(explicitToJson: true)
class AppConfig {

  static final AppConfig _instance =  _$AppConfigFromJson(json.decode("src/jsonfiles/appconfig.json"));

  factory AppConfig() {
    return _instance;
  }

  String appName;

  String appLogoUrl;

  String appLogoAltText;
  
  //factory AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);
  //Map<String, dynamic> toJson() => _$UserToJson(this);
}