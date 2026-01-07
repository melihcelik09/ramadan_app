import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_dua_model.g.dart';

@JsonSerializable()
class DailyDuaModel with EquatableMixin {
  final int? code;
  final String? status;
  final List<Data>? data;

  DailyDuaModel({this.code, this.status, this.data});

  factory DailyDuaModel.fromJson(Map<String, dynamic> json) =>
      _$DailyDuaModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyDuaModelToJson(this);

  @override
  List<Object?> get props => [code, status, data];

  DailyDuaModel copyWith({int? code, String? status, List<Data>? data}) {
    return DailyDuaModel(
      code: code ?? this.code,
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}

@JsonSerializable()
class Data with EquatableMixin {
  final int? number;
  final String? text;
  final Edition? edition;
  final Surah? surah;
  final int? numberInSurah;
  final int? juz;
  final int? manzil;
  final int? page;
  final int? ruku;
  final int? hizbQuarter;
  final bool? sajda;

  Data({
    this.number,
    this.text,
    this.edition,
    this.surah,
    this.numberInSurah,
    this.juz,
    this.manzil,
    this.page,
    this.ruku,
    this.hizbQuarter,
    this.sajda,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  @override
  List<Object?> get props => [
    number,
    text,
    edition,
    surah,
    numberInSurah,
    juz,
    manzil,
    page,
    ruku,
    hizbQuarter,
    sajda,
  ];

  Data copyWith({
    int? number,
    String? text,
    Edition? edition,
    Surah? surah,
    int? numberInSurah,
    int? juz,
    int? manzil,
    int? page,
    int? ruku,
    int? hizbQuarter,
    bool? sajda,
  }) {
    return Data(
      number: number ?? this.number,
      text: text ?? this.text,
      edition: edition ?? this.edition,
      surah: surah ?? this.surah,
      numberInSurah: numberInSurah ?? this.numberInSurah,
      juz: juz ?? this.juz,
      manzil: manzil ?? this.manzil,
      page: page ?? this.page,
      ruku: ruku ?? this.ruku,
      hizbQuarter: hizbQuarter ?? this.hizbQuarter,
      sajda: sajda ?? this.sajda,
    );
  }
}

@JsonSerializable()
class Edition with EquatableMixin {
  final String? identifier;
  final String? language;
  final String? name;
  final String? englishName;
  final String? format;
  final String? type;
  final String? direction;

  Edition({
    this.identifier,
    this.language,
    this.name,
    this.englishName,
    this.format,
    this.type,
    this.direction,
  });

  factory Edition.fromJson(Map<String, dynamic> json) =>
      _$EditionFromJson(json);

  Map<String, dynamic> toJson() => _$EditionToJson(this);

  @override
  List<Object?> get props => [
    identifier,
    language,
    name,
    englishName,
    format,
    type,
    direction,
  ];

  Edition copyWith({
    String? identifier,
    String? language,
    String? name,
    String? englishName,
    String? format,
    String? type,
    String? direction,
  }) {
    return Edition(
      identifier: identifier ?? this.identifier,
      language: language ?? this.language,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      format: format ?? this.format,
      type: type ?? this.type,
      direction: direction ?? this.direction,
    );
  }
}

@JsonSerializable()
class Surah with EquatableMixin {
  final int? number;
  final String? name;
  final String? englishName;
  final String? englishNameTranslation;
  final int? numberOfAyahs;
  final String? revelationType;

  Surah({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.numberOfAyahs,
    this.revelationType,
  });

  factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);

  Map<String, dynamic> toJson() => _$SurahToJson(this);

  @override
  List<Object?> get props => [
    number,
    name,
    englishName,
    englishNameTranslation,
    numberOfAyahs,
    revelationType,
  ];

  Surah copyWith({
    int? number,
    String? name,
    String? englishName,
    String? englishNameTranslation,
    int? numberOfAyahs,
    String? revelationType,
  }) {
    return Surah(
      number: number ?? this.number,
      name: name ?? this.name,
      englishName: englishName ?? this.englishName,
      englishNameTranslation:
          englishNameTranslation ?? this.englishNameTranslation,
      numberOfAyahs: numberOfAyahs ?? this.numberOfAyahs,
      revelationType: revelationType ?? this.revelationType,
    );
  }
}
