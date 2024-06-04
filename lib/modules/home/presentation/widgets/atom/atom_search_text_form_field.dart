import 'package:b2b_hortifruti/shared/presentation/theme/colors.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AtomSearchTextFormField extends StatelessWidget {
  const AtomSearchTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final decoration = InputDecoration(
      suffixIcon: const Icon(Icons.search,size: 26,),
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
      boxShadow: const [
        BoxShadow(
          color: AppColors.shadow1,
          blurRadius: 8,
          offset: Offset(2, 2),
        ),
      ],
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
              style: AppTextStyle.search,
              decoration: decoration,
            ),
          ),
        ),
      ),
    );
  }
}
