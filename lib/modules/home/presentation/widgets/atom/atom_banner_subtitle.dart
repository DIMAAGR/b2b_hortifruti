import 'package:b2b_hortifruti/modules/home/presentation/services/responsive_service.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AtomBannerSubtitle extends StatelessWidget {
  final String subtitle;
  const AtomBannerSubtitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24.0),
      width: ResponsiveService.isMobile(context) ? 224 : 256,
      child: Text(
        subtitle,
        style: AppTextStyle.bannerSubtitle
            .copyWith(fontSize: ResponsiveService.isMobile(context) ? 14 : 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
