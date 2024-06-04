import 'package:b2b_hortifruti/modules/home/domain/entities/category_enum.dart';
import 'package:b2b_hortifruti/modules/home/presentation/services/responsive_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../atom/atom_category_button.dart';

class MoleculeCategoryList extends StatelessWidget {
  final Function(CategoryEnum category) onCategoryPressed;
  final CategoryEnum actualCategory;

  const MoleculeCategoryList({
    super.key,
    required this.onCategoryPressed,
    required this.actualCategory,
  });

  @override
  Widget build(BuildContext context) {
    ScrollBehavior behavior = const ScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    );

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ScrollConfiguration(
        behavior: behavior,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ResponsiveService.isMobile(context)
              ? Row(
                  children: [
                    const SizedBox(width: 16),
                    AtomCategoryButton.mobile(
                      title: 'Todas as categorias',
                      onPressed: () {},
                    ),
                    const SizedBox(width: 4),
                    ...CategoryEnum.values.map(
                      (value) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AtomCategoryButton.mobile(
                          title: value.name,
                          onPressed:
                              value == actualCategory ? null : () => onCategoryPressed(value),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 16),
                    AtomCategoryButton.bold(
                      icon: const Icon(Icons.menu_rounded),
                      title: 'Todas as categorias',
                      onPressed: () {},
                    ),
                    const SizedBox(width: 4),
                    ...CategoryEnum.values.map(
                      (value) => Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: AtomCategoryButton.web(
                          title: value.name,
                          onPressed:
                              value == actualCategory ? null : () => onCategoryPressed(value),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
        ),
      ),
    );
  }
}
