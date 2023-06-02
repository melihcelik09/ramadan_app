import 'package:json_annotation/json_annotation.dart';

part 'prayer_response_model.g.dart';

@JsonSerializable()
class PrayerResponseModel {
  Map<String, dynamic>? times;

  PrayerResponseModel({this.times});

  factory PrayerResponseModel.fromJson(Map<String, dynamic> json) => _$PrayerResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrayerResponseModelToJson(this);

  @override
  String toString() {
    return 'PrayerResponseModel times: $times';
  }
}
