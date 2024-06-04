import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../shared/presentation/theme/colors.dart';
import '../../../../../shared/presentation/theme/text_styles.dart';

class AtomUserMenu extends StatelessWidget {
  final VoidCallback onPressed;
  final String? storeName;
  final String? cnpjValue;
  const AtomUserMenu({
    super.key,
    required this.onPressed,
    this.storeName,
    this.cnpjValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64,
        width: 228,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  storeName == null
                      ? Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: Colors.white,
                          child: Container(
                            height: 24,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        )
                      : Text(storeName ?? '', style: AppTextStyle.menuTitle),
                  SizedBox(height: cnpjValue == null && storeName == null ? 8 : 2),
                  cnpjValue == null
                      ? Shimmer.fromColors(
                          baseColor: Colors.black12,
                          highlightColor: Colors.white,
                          child: Container(
                              height: 19,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(4),
                              )),
                        )
                      : Text(cnpjValue ?? '', style: AppTextStyle.menuSubtitle)
                ],
              ),
              const SizedBox(width: 16),
              const Icon(Icons.arrow_drop_down, size: 32, color: AppColors.black),
            ],
          ),
        ));
  }
}
