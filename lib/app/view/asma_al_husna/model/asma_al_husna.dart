import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'asma_al_husna.g.dart';


@JsonSerializable()
class AsmaAlHusna with EquatableMixin {
  List<Main>? main;

  AsmaAlHusna({
    this.main,
  });

  factory AsmaAlHusna.fromJson(Map<String, dynamic> json) =>
      _$AsmaAlHusnaFromJson(json);

  Map<String, dynamic> toJson() => _$AsmaAlHusnaToJson(this);

  @override
  List<Object?> get props => [main];

  AsmaAlHusna copyWith({
    List<Main>? main,
  }) {
    return AsmaAlHusna(
      main: main ?? this.main,
    );
  }
}

@JsonSerializable()
class Main with EquatableMixin {
  String? id;
  String? arName;
  String? enName;
  String? meaning;
  String? explanation;
  String? benefit;

  Main({
    this.id,
    this.arName,
    this.enName,
    this.meaning,
    this.explanation,
    this.benefit,
  });

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Map<String, dynamic> toJson() => _$MainToJson(this);

  @override
  List<Object?> get props =>
      [id, arName, enName, meaning, explanation, benefit];

  Main copyWith({
    String? id,
    String? arName,
    String? enName,
    String? meaning,
    String? explanation,
    String? benefit,
  }) {
    return Main(
      id: id ?? this.id,
      arName: arName ?? this.arName,
      enName: enName ?? this.enName,
      meaning: meaning ?? this.meaning,
      explanation: explanation ?? this.explanation,
      benefit: benefit ?? this.benefit,
    );
  }
}
