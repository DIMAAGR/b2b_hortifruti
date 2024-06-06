import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

extension BoxDecorationExt on BoxDecoration {
  BoxDecoration withBoxShadow(List<BoxShadow> shadows) {
    return copyWith(boxShadow: shadows);
  }
}
