///
/// 默认类型转换
///

String jsonStringTransformer(j) =>
    j == null ? "" : (j is String ? j : j.toString());

bool jsonBoolTransformer(j) =>
    j is bool ? j : (j is num ? j > 0 : (j == '1' || j == 'true'));

int jsonIntTransformer(j) =>
    j is num ? j.toInt() : (j is String ? int.tryParse(j) : j as int);

double jsonDoubleTransformer(j) =>
    j is num ? j.toDouble() : (j is String ? double.tryParse(j) : j as double);

DateTime jsonDateTimeTransformer(j) =>
    j is num ? DateTime.fromMillisecondsSinceEpoch((j * 1000).toInt()) : null;

List<String> jsonJoinedListTransformer(j) =>
    j is String ? j?.split(',') : j?.cast<String>();

Map jsonMapTransformer(j) => j is Map ? j : <String, dynamic>{};

const Map<String, String> defaultTransformers = {
  'String': 'jsonStringTransformer',
  'bool': 'jsonBoolTransformer',
  'int': 'jsonIntTransformer',
  'double': 'jsonDoubleTransformer',
  'List<String>': 'jsonJoinedListTransformer',
  'Map': 'jsonMapTransformer',
};
