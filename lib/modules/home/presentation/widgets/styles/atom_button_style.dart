import 'package:b2b_hortifruti/shared/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class AtomButtonStyle {
  static ButtonStyle getWebButtonStyle() {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(_foregroundColor),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(_backgroundColor),
      elevation: const MaterialStatePropertyAll<double>(0),
      splashFactory: NoSplash.splashFactory,
      animationDuration: Duration.zero,
    );
  }

  static Color _foregroundColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.disabled)) {
      return Colors.white;
    } else {
      return AppColors.midnightBlue;
    }
  }

  static Color _backgroundColor(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return AppColors.midnightBlue;
    } else if (states.contains(MaterialState.disabled)) {
      return AppColors.orange;
    } else if (states.contains(MaterialState.hovered)) {
      return Colors.black26;
    } else {
      return Colors.white;
    }
  }
}
