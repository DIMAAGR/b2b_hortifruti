import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AtomAppBarHeader extends StatelessWidget {
  final String? storeName;
  final String? cnpjValue;

  const AtomAppBarHeader({
    super.key,
    required this.storeName,
    required this.cnpjValue,
  });

  @override
  Widget build(BuildContext context) {
    final BoxDecoration containerDecoration = BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.circular(6),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 16),
        storeName == null
            ? Shimmer.fromColors(
                baseColor: Colors.black12,
                highlightColor: Colors.white,
                child: Container(height: 40, width: 210, decoration: containerDecoration),
              )
            : Text(storeName ?? '', style: AppTextStyle.headerTitle),
        const SizedBox(height: 8),
        cnpjValue == null
            ? Shimmer.fromColors(
                baseColor: Colors.black12,
                highlightColor: Colors.white,
                child: Container(height: 20, width: 160, decoration: containerDecoration),
              )
            : Text(cnpjValue ?? '', style: AppTextStyle.headerSubtitle)
      ],
    );
  }
}
