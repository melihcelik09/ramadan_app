import 'package:json_annotation/json_annotation.dart';

part 'daily_name_model.g.dart';

@JsonSerializable()
class DailyNameModel {
  List<String?>? names;

  DailyNameModel({this.names});

  factory DailyNameModel.fromJson(Map<String, dynamic> json) => _$DailyNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyNameModelToJson(this);

  @override
  String toString() {
    return 'DailyNameModel{names: $names}';
  }

  DailyNameModel copyWith({
    List<String?>? names,
  }) {
    return DailyNameModel(
      names: names ?? this.names,
    );
  }
}
