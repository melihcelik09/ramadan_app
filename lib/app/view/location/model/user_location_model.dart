import 'package:json_annotation/json_annotation.dart';

part 'user_location_model.g.dart';

@JsonSerializable()
class UserLocationModel {
  String? country;
  String? countryCode;
  String? city;
  String? region;
  double? latitude;
  double? longitude;

  UserLocationModel({
    this.country,
    this.countryCode,
    this.city,
    this.region,
    this.latitude,
    this.longitude,
  });

  factory UserLocationModel.fromJson(Map<String, dynamic> json) => _$UserLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationModelToJson(this);

  @override
  String toString() {
    return 'country: $country, countryCode: $countryCode, city: $city, region: $region, latitude: $latitude, longitude: $longitude';
  }
}
