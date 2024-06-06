import 'package:flutter/material.dart';

import '../../../../shared/presentation/theme/colors.dart';

abstract class AtomShadowStyle {
  static const List<BoxShadow> categoryHeaderButton = [
    BoxShadow(
      blurRadius: 8,
      offset: Offset(0, 4),
      color: AppColors.shadow3,
    ),
  ];

  static const List<BoxShadow> categoryHeader = [
    BoxShadow(
      blurRadius: 10,
      offset: Offset(0, 4),
      color: AppColors.shadow2,
    ),
  ];
  
  static const List<BoxShadow> searchTextFormField = [
    BoxShadow(
      color: AppColors.shadow1,
      blurRadius: 8,
      offset: Offset(2, 2),
    ),
  ];

  static const List<BoxShadow> productCard = [
    BoxShadow(
      color: AppColors.shadow1,
      offset: Offset(2, 2),
      blurRadius: 8,
    ),
  ];
}
