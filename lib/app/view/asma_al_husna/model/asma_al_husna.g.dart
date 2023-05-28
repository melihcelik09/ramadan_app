// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asma_al_husna.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsmaAlHusna _$AsmaAlHusnaFromJson(Map<String, dynamic> json) => AsmaAlHusna(
      main: (json['main'] as List<dynamic>?)
          ?.map((e) => Main.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AsmaAlHusnaToJson(AsmaAlHusna instance) =>
    <String, dynamic>{
      'main': instance.main,
    };

Main _$MainFromJson(Map<String, dynamic> json) => Main(
      id: json['id'] as String?,
      arName: json['arName'] as String?,
      enName: json['enName'] as String?,
      meaning: json['meaning'] as String?,
      explanation: json['explanation'] as String?,
      benefit: json['benefit'] as String?,
    );

Map<String, dynamic> _$MainToJson(Main instance) => <String, dynamic>{
      'id': instance.id,
      'arName': instance.arName,
      'enName': instance.enName,
      'meaning': instance.meaning,
      'explanation': instance.explanation,
      'benefit': instance.benefit,
    };
