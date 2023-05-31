import 'package:json_annotation/json_annotation.dart';

part 'user_location_model.g.dart';

@JsonSerializable()
class UserLocationModel {
  String? country;
  String? state;
  String? city;

  UserLocationModel({
    this.country,
    this.state,
    this.city,
  });

  factory UserLocationModel.fromJson(Map<String, dynamic> json) => _$UserLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLocationModelToJson(this);

  @override
  String toString() {
    return 'Country: $country, State: $state, City: $city';
  }
}
