import 'package:json_annotation/json_annotation.dart';

part 'transformer_example.g.dart';

@JsonSerializable()
class TransformerTest extends Object {
  int pInt;
  double pDouble;
  String pString;
  bool pBool;
  TransformerTest pModel;
  List<String> pList;

  TransformerTest(this.pInt, this.pDouble, this.pBool, this.pString,
      this.pModel, this.pList);

  factory TransformerTest.fromJson(Map<String, dynamic> srcJson) =>
      _$TransformerTestFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TransformerTestToJson(this);

  @override
  int get hashCode =>
      pInt.hashCode ^
      pDouble.hashCode ^
      pString.hashCode ^
      pBool.hashCode ^
      pModel.hashCode ^
      pList.hashCode;

  @override
  bool operator ==(Object other) =>
      other is TransformerTest &&
      pInt == other.pInt &&
      pDouble == other.pDouble &&
      pString == other.pString &&
      pBool == other.pBool &&
      pModel == other.pModel &&
      pList == other.pList;
}
