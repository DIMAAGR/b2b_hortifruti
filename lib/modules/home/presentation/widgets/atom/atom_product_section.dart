import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../shared/presentation/theme/colors.dart';
import '../../services/responsive_service.dart';
import '../../styles/atom_button_style.dart';

class AtomProductSection extends StatelessWidget {
  final Color backgroundColor;
  final String? title;
  final String? subtitle;
  final VoidCallback onSeeMorePressed;
  final bool visible;
  const AtomProductSection({
    super.key,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    required this.onSeeMorePressed,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(32),
    );

    final loadingDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    );

    final internalContainerDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(64),
      color: Colors.white,
    );

    return Container(
      decoration: decoration,
      height: ResponsiveService.isMobile(context) ? 256 : 272,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 48,
            width: MediaQuery.of(context).size.width - 96,
            margin: const EdgeInsets.all(16),
            decoration: internalContainerDecoration,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 16),
                    visible
                        ? Text(
                            title!,
                            style: AppTextStyle.bannerTitle.copyWith(
                              fontSize: ResponsiveService.isMobile(context) ? 18 : 20,
                              color: AppColors.midnightBlue,
                            ),
                          )
                        : Container(
                            decoration: loadingDecoration,
                            width: kIsWeb ? 272 : MediaQuery.of(context).size.width - 128,
                            height: 24,
                            child: Shimmer.fromColors(
                              child: Container(
                                decoration: loadingDecoration,
                                width: 264,
                                height: 24,
                              ),
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                            ),
                          ),
                    const SizedBox(width: 16),
                    if (ResponsiveService.isMobile(context) == false)
                      visible
                          ? FittedBox(
                              fit: BoxFit.cover,
                              child: Text(
                                subtitle!,
                                style: AppTextStyle.bannerSubtitle.copyWith(
                                  fontSize: ResponsiveService.isMobile(context) ? 14 : 16,
                                  color: AppColors.midnightBlue,
                                ),
                              ),
                            )
                          : Container(),
                  ],
                ),
                if (ResponsiveService.isMobile(context) == false)
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: visible
                        ? OutlinedButton(
                            onPressed: onSeeMorePressed,
                            style: AtomButtonStyle.getOutlinedButtonStyle().copyWith(
                              side: const WidgetStatePropertyAll(
                                  BorderSide(color: AppColors.midnightBlue, width: 1)),
                            ),
                            child: Text(
                              'Ver 150 itens',
                              style:
                                  AppTextStyle.bannerButton.copyWith(color: AppColors.midnightBlue),
                            ),
                          )
                        : Shimmer.fromColors(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              height: 32,
                              width: 128,
                            ),
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                          ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
