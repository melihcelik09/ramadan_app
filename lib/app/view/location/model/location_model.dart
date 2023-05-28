import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel with EquatableMixin {
  String? code;
  String? name;

  LocationModel({
    this.code,
    this.name,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  @override
  List<Object?> get props => [code, name];

  LocationModel copyWith({
    String? code,
    String? name,
  }) {
    return LocationModel(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }
}
