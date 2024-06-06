import 'package:b2b_hortifruti/modules/home/presentation/services/responsive_service.dart';
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
      width: ResponsiveService.isMobile(context) ?  248: 304,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        color: color,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: ResponsiveService.isMobile(context) ?  8.0: 16.0),
        child: Center(child: Text(title, style: AppTextStyle.bannerTitle.copyWith(
          fontSize: ResponsiveService.isMobile(context) ? 18 : 24
        ))),
      ),
    );
  }
}
