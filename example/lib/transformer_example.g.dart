// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transformer_example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransformerTest _$TransformerTestFromJson(Map<String, dynamic> json) {
  return TransformerTest(
    jsonIntTransformer(json['pInt']),
    jsonDoubleTransformer(json['pDouble']),
    jsonBoolTransformer(json['pBool']),
    jsonStringTransformer(json['pString']),
    json['pModel'] == null
        ? null
        : TransformerTest.fromJson(
            jsonMapTransformer(json['pModel']) as Map<String, dynamic>),
    (json['pList'] as List)?.map((e) => jsonStringTransformer(e))?.toList(),
  );
}

Map<String, dynamic> _$TransformerTestToJson(TransformerTest instance) =>
    <String, dynamic>{
      'pInt': instance.pInt,
      'pDouble': instance.pDouble,
      'pString': instance.pString,
      'pBool': instance.pBool,
      'pModel': instance.pModel,
      'pList': instance.pList,
    };
