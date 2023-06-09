import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'weather_language_model.g.dart';

@JsonSerializable()
class WeatherLanguage with EquatableMixin {
  int? code;
  String? day;
  String? night;
  int? icon;
  List<Languages>? languages;

  WeatherLanguage({
    this.code,
    this.day,
    this.night,
    this.icon,
    this.languages,
  });

  factory WeatherLanguage.fromJson(Map<String, dynamic> json) =>
      _$WeatherLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherLanguageToJson(this);

  @override
  List<Object?> get props => [code, day, night, icon, languages];

  WeatherLanguage copyWith({
    int? code,
    String? day,
    String? night,
    int? icon,
    List<Languages>? languages,
  }) {
    return WeatherLanguage(
      code: code ?? this.code,
      day: day ?? this.day,
      night: night ?? this.night,
      icon: icon ?? this.icon,
      languages: languages ?? this.languages,
    );
  }
}

@JsonSerializable()
class Languages with EquatableMixin {
  String? langName;
  @JsonKey(name: 'lang_iso')
  String? langIso;
  @JsonKey(name: 'day_text')
  String? dayText;
  @JsonKey(name: 'night_text')
  String? nightText;

  Languages({
    this.langName,
    this.langIso,
    this.dayText,
    this.nightText,
  });

  factory Languages.fromJson(Map<String, dynamic> json) =>
      _$LanguagesFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesToJson(this);

  @override
  List<Object?> get props => [langName, langIso, dayText, nightText];

  Languages copyWith({
    String? langName,
    String? langIso,
    String? dayText,
    String? nightText,
  }) {
    return Languages(
      langName: langName ?? this.langName,
      langIso: langIso ?? this.langIso,
      dayText: dayText ?? this.dayText,
      nightText: nightText ?? this.nightText,
    );
  }
}
