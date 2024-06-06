import 'package:b2b_hortifruti/modules/home/presentation/services/responsive_service.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_banner_title.dart';
import 'package:flutter/material.dart';

import '../atom/atom_banner_button.dart';
import '../atom/atom_banner_subtitle.dart';
import '../atom/atom_category_header.dart';

class MoleculeFavoritesBanner extends StatelessWidget {
  final VoidCallback onSeeMorePressed;
  final String videoAsset;
  final Color backgroundColor;
  final Color backgroundTitleColor;
  final String title;
  final String subtitle;

  const MoleculeFavoritesBanner({
    super.key,
    required this.onSeeMorePressed,
    required this.videoAsset,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    required this.backgroundTitleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      height: ResponsiveService.isMobile(context) ? 200 : 296,
      child: AtomCategoryHeader(
        backgroundColor: backgroundColor,
        videoAsset: videoAsset,
        contentHeight: ResponsiveService.isMobile(context) ? 32 : 80,
        contentWidth: ResponsiveService.isMobile(context) ? 88 : 152,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AtomBannerTitle(title: title, color: backgroundTitleColor),
            AtomBannerSubtitle(subtitle: subtitle),
            AtomBannerButton(onPressed: onSeeMorePressed)
          ],
        ),
      ),
    );
  }
}
