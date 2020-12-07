import 'dart:convert';

import 'package:example/transformer_example.dart';
import 'package:test/test.dart';

void main() {
  test('Int', () {
    expect(_decode('{"pInt": 1}').pInt, 1);
    expect(_decode('{"pInt": "1"}').pInt, 1);
  });
  test('Double', () {
    expect(_decode('{"pDouble": 1}').pDouble, 1.0);
    expect(_decode('{"pDouble": 1.1}').pDouble, 1.1);
    expect(_decode('{"pDouble": "1.1"}').pDouble, 1.1);
  });
  test('Bool', () {
    expect(_decode('{"pBool": true}').pBool, true);
    expect(_decode('{"pBool": "true"}').pBool, true);
    expect(_decode('{"pBool": 1}').pBool, true);
    expect(_decode('{"pBool": "1"}').pBool, true);
  });
  test('String', () {
    expect(_decode('{"pString": "1"}').pString, '1');
    expect(_decode('{"pString": 1}').pString, '1');
    expect(_decode('{"pString": 1.1}').pString, '1.1');
  });
  test('Map & Array', () {
    final nullModel = TransformerTest(null, null, false, '', null, null);
    expect(_decode('{"pModel": []}').pModel, nullModel);
    expect(_decode('{"pModel": {}}').pModel, nullModel);
    expect(_decode('{"pModel": {"pInt": 1}}').pModel,
        TransformerTest(1, null, false, '', null, null));
    expect(_decode('{"pList": [1]}').pList, ['1']);
  });
}

TransformerTest _decode(String srcJson) =>
    TransformerTest.fromJson(json.decode(srcJson) as Map<String, dynamic>);
