import 'package:b2b_hortifruti/shared/presentation/theme/colors.dart';
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
              height: 112,
              width: 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: color,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    color: AppColors.shadow3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(title, style: AppTextStyle.categoryHeaderButton),
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
              baseColor: Colors.black12,
              highlightColor: Colors.white70,
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
