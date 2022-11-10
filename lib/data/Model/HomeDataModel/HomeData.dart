import 'package:json_annotation/json_annotation.dart';
part 'HomeData.g.dart';

@JsonSerializable()
class HomeData{
  DateTime? time;
  String? name;

  HomeData({this.time,this.name});

  factory HomeData.fromJson(Map<String, dynamic> json) => _$HomeDataFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$HomeDataToJson(this);

}
