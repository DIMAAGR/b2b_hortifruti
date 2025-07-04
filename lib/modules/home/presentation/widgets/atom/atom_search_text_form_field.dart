import 'package:b2b_hortifruti/modules/home/presentation/styles/atom_shadow_style.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/colors.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AtomSearchTextFormField extends StatelessWidget {
  final Function(String?) onFieldSubmitted;
  const AtomSearchTextFormField({super.key, required this.onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      suffixIcon: const Icon(
        Icons.search,
        size: 26,
      ),
      prefixIconColor: AppColors.shadowGrey,
      hintStyle: AppTextStyle.search,
      hintText: 'Buscar produtos',
      contentPadding: EdgeInsets.zero,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
    );

    final containerDecoration = BoxDecoration(
      color: Colors.white,
      boxShadow: AtomShadowStyle.searchTextFormField,
      borderRadius: BorderRadius.circular(32),
    );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          decoration: containerDecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              
              onFieldSubmitted: onFieldSubmitted,
              style: AppTextStyle.search,
              decoration: decoration,
            ),
          ),
        ),
      ),
    );
  }
}
