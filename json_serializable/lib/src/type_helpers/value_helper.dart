// Copyright (c) 2018, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/dart/element/type.dart';
import 'package:source_gen/source_gen.dart' show TypeChecker;

import '../helper_core.dart';
import '../shared_checkers.dart';
import '../type_helper.dart';

class ValueHelper extends TypeHelper<TypeHelperContextWithConfig> {
  const ValueHelper();

  @override
  String serialize(
    DartType targetType,
    String expression,
    TypeHelperContextWithConfig context,
  ) {
    if (isObjectOrDynamic(targetType) ||
        simpleJsonTypeChecker.isAssignableFromType(targetType)) {
      return expression;
    }

    return null;
  }

  @override
  String deserialize(
    DartType targetType,
    String expression,
    TypeHelperContextWithConfig context,
  ) {
    if (isObjectOrDynamic(targetType)) {
      // just return it as-is. We'll hope it's safe.
      return expression;
    } else if (const TypeChecker.fromUrl('dart:core#double')
        .isExactlyType(targetType)) {
      final castFunc = context.config.transformers['double'];
      if (castFunc != null) {
        return '$castFunc($expression)';
      } else {
        return '($expression as num)${context.nullable ? '?' : ''}.toDouble()';
      }
    } else if (simpleJsonTypeChecker.isAssignableFromType(targetType)) {
      final typeCode = typeToCode(targetType);
      final castFunc = context.config.transformers[typeCode];
      if (castFunc != null) {
        return '$castFunc($expression)';
      } else {
        return '$expression as $typeCode';
      }
    }

    return null;
  }
}
