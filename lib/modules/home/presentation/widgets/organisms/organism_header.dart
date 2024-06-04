import 'package:b2b_hortifruti/modules/home/presentation/widgets/molecules/molecule_header.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/category_enum.dart';
import '../../services/responsive_service.dart';
import '../atom/atom_appbar_header.dart';
import '../molecules/molecule_category_list.dart';

class OrganismHeader extends StatelessWidget {
  final String? storeName;
  final String? cnpjValue;
  final Function(CategoryEnum) onCategoryPressed;
  final CategoryEnum actualCategory;

  const OrganismHeader({
    super.key,
    this.storeName,
    this.cnpjValue,
    required this.onCategoryPressed,
    required this.actualCategory,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 88,
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black26,
      centerTitle: true,
      elevation: 5,
      
      bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 56),
        child: MoleculeCategoryList(
          onCategoryPressed: onCategoryPressed,
          actualCategory: actualCategory,
        ),
      ),
      title: ResponsiveService.isMobile(context)
          ? AtomAppBarHeader(
              storeName: storeName,
              cnpjValue: cnpjValue,
            )
          : MoleculeHeader(
              onPressed: () {},
              onCartPressed: () {},
              cnpjValue: cnpjValue,
              storeName: storeName,
            ),
    );
  }
}
