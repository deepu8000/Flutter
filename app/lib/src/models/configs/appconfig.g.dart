// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appconfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) {
  return AppConfig()
    ..appName = json['appName'] as String
    ..appLogoUrl = json['appLogoUrl'] as String
    ..appLogoAltText = json['appLogoAltText'] as String;
}

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
      'appName': instance.appName,
      'appLogoUrl': instance.appLogoUrl,
      'appLogoAltText': instance.appLogoAltText,
    };
