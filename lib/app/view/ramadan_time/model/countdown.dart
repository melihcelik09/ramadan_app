import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'countdown.g.dart';

@JsonSerializable()
class Countdown with EquatableMixin {
  int? days;
  int? hours;
  int? minutes;

  Countdown({
    this.days,
    this.hours,
    this.minutes,
  });

  factory Countdown.fromJson(Map<String, dynamic> json) =>
      _$CountdownFromJson(json);

  Map<String, dynamic> toJson() => _$CountdownToJson(this);

  @override
  List<Object?> get props => [days, hours, minutes];

  Countdown copyWith({
    int? days,
    int? hours,
    int? minutes,
  }) {
    return Countdown(
      days: days ?? this.days,
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
    );
  }
}