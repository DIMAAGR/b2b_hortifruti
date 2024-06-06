import 'package:b2b_hortifruti/modules/home/presentation/services/responsive_service.dart';
import 'package:b2b_hortifruti/modules/home/presentation/styles/atom_shadow_style.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AtomCategoryHeaderButton extends StatelessWidget {
  final String title;
  final String asset;
  final VoidCallback onPressed;
  final Color color;
  final bool visible;
  const AtomCategoryHeaderButton({
    super.key,
    required this.title,
    required this.asset,
    required this.onPressed,
    required this.color,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return visible
        ? InkWell(
            child: Container(
              height: ResponsiveService.isMobile(context) ? 96 : 112,
              width: ResponsiveService.isMobile(context) ? 224 : 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: color,
                boxShadow: AtomShadowStyle.categoryHeaderButton,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(title,
                        style: AppTextStyle.categoryHeaderButton.copyWith(
                          fontSize: ResponsiveService.isMobile(context) ? 18 : 20,
                        )),
                  ),
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      child: Image.asset(asset)),
                ],
              ),
            ),
          )
        : Container(
            height: 112,
            width: 256,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 240, 240),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 112,
                width: 256,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 240, 240, 240),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          );
  }
}
