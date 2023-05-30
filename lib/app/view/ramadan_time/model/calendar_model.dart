import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'calendar_model.g.dart';

@JsonSerializable()
class CalendarModel with EquatableMixin {
  Data? data;

  CalendarModel({
    this.data,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) =>
      _$CalendarModelFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarModelToJson(this);

  @override
  List<Object?> get props => [data];

  CalendarModel copyWith({
    Data? data,
  }) {
    return CalendarModel(
      data: data ?? this.data,
    );
  }
}

@JsonSerializable()
class Data with EquatableMixin {
  Gregorian? gregorian;
  Hijri? hijri;

  Data({
    this.gregorian,
    this.hijri,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props => [gregorian, hijri];

  Data copyWith({
    Gregorian? gregorian,
    Hijri? hijri,
  }) {
    return Data(
      gregorian: gregorian ?? this.gregorian,
      hijri: hijri ?? this.hijri,
    );
  }
}


@JsonSerializable()
class Gregorian with EquatableMixin {
  String? date;

  Gregorian({
    this.date,
  });

  factory Gregorian.fromJson(Map<String, dynamic> json) =>
      _$GregorianFromJson(json);

  Map<String, dynamic> toJson() => _$GregorianToJson(this);

  @override
  List<Object?> get props => [date];

  Gregorian copyWith({
    String? date,
  }) {
    return Gregorian(
      date: date ?? this.date,
    );
  }
}


@JsonSerializable()
class Hijri with EquatableMixin {
  String? date;

  Hijri({
    this.date,
  });

  factory Hijri.fromJson(Map<String, dynamic> json) => _$HijriFromJson(json);

  Map<String, dynamic> toJson() => _$HijriToJson(this);

  @override
  List<Object?> get props => [date];

  Hijri copyWith({
    String? date,
  }) {
    return Hijri(
      date: date ?? this.date,
    );
  }
}
