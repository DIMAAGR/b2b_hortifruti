import 'package:b2b_hortifruti/shared/presentation/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AtomButtonStyle {
  static ButtonStyle getWebButtonStyle() {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(_foregroundColor),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(_backgroundColorWeb),
      elevation: const MaterialStatePropertyAll<double>(0),
      splashFactory: NoSplash.splashFactory,
      animationDuration: Duration.zero,
    );
  }

  static ButtonStyle getMobileButtonStyle() {
    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith<Color>(_foregroundColor),
      backgroundColor: MaterialStateProperty.resolveWith<Color>(_backgroundColorMobile),
      elevation: const MaterialStatePropertyAll<double>(0),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>(_shape),
      minimumSize:  const MaterialStatePropertyAll(Size(80, !kIsWeb ? 32 : 48)),
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

  static OutlinedBorder _shape(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.disabled)) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.midnightBlue),
      );
    } else {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: AppColors.grey),
      );
    }
  }

  static Color _backgroundColorWeb(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return AppColors.midnightBlue;
    } else if (states.contains(MaterialState.disabled)) {
      return AppColors.orange;
    } else if (states.contains(MaterialState.hovered)) {
      return Colors.black12;
    } else {
      return Colors.white;
    }
  }

  static Color _backgroundColorMobile(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed) || states.contains(MaterialState.disabled)) {
      return AppColors.midnightBlue;
    } else if (states.contains(MaterialState.hovered)) {
      return Colors.black12;
    } else {
      return Colors.white;
    }
  }
}
