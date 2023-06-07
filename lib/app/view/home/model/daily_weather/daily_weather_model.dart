import 'package:json_annotation/json_annotation.dart';

part 'daily_weather_model.g.dart';

@JsonSerializable()
class DailyWeatherModel {
  CurrentModel? current;

  DailyWeatherModel({this.current});

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyWeatherModelToJson(this);
}


@JsonSerializable()
class CurrentModel {
  @JsonKey(name: 'last_updated')
  String? lastUpdated;
  @JsonKey(name: 'temp_c')
  double? tempCelcius;
  @JsonKey(name: 'feelslike_c')
  double? feelsLikeCelcius;
  ConditionModel? condition;

  CurrentModel(
      {this.lastUpdated,
      this.tempCelcius,
      this.feelsLikeCelcius,
      this.condition});

  factory CurrentModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentModelToJson(this);
}

@JsonSerializable()
class ConditionModel {
  String? text;
  String? icon;
  int? code;

  ConditionModel({this.text, this.icon, this.code});

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}
