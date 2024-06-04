import 'package:b2b_hortifruti/shared/presentation/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AtomButtonStyle {
  static ButtonStyle getWebButtonStyle() {
    return ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>(_foregroundColor),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(_backgroundColorWeb),
      elevation: const WidgetStatePropertyAll<double>(0),
      splashFactory: NoSplash.splashFactory,
      animationDuration: Duration.zero,
    );
  }

  static ButtonStyle getMobileButtonStyle() {
    return ButtonStyle(
      foregroundColor: WidgetStateProperty.resolveWith<Color>(_foregroundColor),
      backgroundColor: WidgetStateProperty.resolveWith<Color>(_backgroundColorMobile),
      elevation: const WidgetStatePropertyAll<double>(0),
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>(_shape),
      minimumSize: const WidgetStatePropertyAll(Size(80, !kIsWeb ? 32 : 48)),
      splashFactory: NoSplash.splashFactory,
      animationDuration: Duration.zero,
    );
  }

  static ButtonStyle getOrangeButtonStyle() {
    return const ButtonStyle(
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      backgroundColor: WidgetStatePropertyAll(AppColors.orange),
      elevation: WidgetStatePropertyAll<double>(0),
      splashFactory: NoSplash.splashFactory,
      animationDuration: Duration.zero,
    );
  }

  static Color _foregroundColor(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed) || states.contains(WidgetState.disabled)) {
      return Colors.white;
    } else {
      return AppColors.midnightBlue;
    }
  }

  static OutlinedBorder _shape(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed) || states.contains(WidgetState.disabled)) {
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

  static Color _backgroundColorWeb(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed)) {
      return AppColors.midnightBlue;
    } else if (states.contains(WidgetState.disabled)) {
      return AppColors.orange;
    } else if (states.contains(WidgetState.hovered)) {
      return Colors.black12;
    } else {
      return Colors.white;
    }
  }

  static Color _backgroundColorMobile(Set<WidgetState> states) {
    if (states.contains(WidgetState.pressed) || states.contains(WidgetState.disabled)) {
      return AppColors.midnightBlue;
    } else if (states.contains(WidgetState.hovered)) {
      return Colors.black12;
    } else {
      return Colors.white;
    }
  }
}
