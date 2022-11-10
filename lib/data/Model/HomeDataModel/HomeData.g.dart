// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'name': instance.name,
    };
