import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AtomBannerSubtitle extends StatelessWidget {
  final String subtitle;
  const AtomBannerSubtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      width: 256,
      child: Text(
        subtitle,
        style: AppTextStyle.bannerSubtitle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
