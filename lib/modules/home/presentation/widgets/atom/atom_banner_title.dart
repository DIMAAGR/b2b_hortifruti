import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AtomBannerTitle extends StatelessWidget {
  final String title;
  final Color color;

  const AtomBannerTitle({
    super.key,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 304,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: color,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Center(child: Text(title, style: AppTextStyle.bannerTitle)),
      ),
    );
  }
}
