import 'package:b2b_hortifruti/modules/home/presentation/services/responsive_service.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_category_header.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_yandeh_logo.dart';
import 'package:b2b_hortifruti/shared/presentation/consts/videos.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/presentation/theme/colors.dart';
import '../atom/atom_category_header_button.dart';

class MoleculeCategoryBanner extends StatelessWidget {
  final bool isCategoriesVisible;
  const MoleculeCategoryBanner({
    super.key,
    required this.isCategoriesVisible,
  });

  @override
  Widget build(BuildContext context) {
    ScrollBehavior behavior = const ScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      height: ResponsiveService.isMobile(context) ? 296 : 312,
      child: Stack(
        children: [
          AtomCategoryHeader(
            backgroundColor: AppColors.darkForestGreen,
            videoAsset: VideosPath.categoryBanner,
            contentHeight: ResponsiveService.isMobile(context) ? 32 : 80,
            contentWidth: ResponsiveService.isMobile(context) ? 88 : 152,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 64.0),
                  child: AtomYandehLogo.white(
                    width: ResponsiveService.isMobile(context) ? 120 : 152,
                    height: ResponsiveService.isMobile(context) ? 64 : 80,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 64,
              height: 112,
              child: Center(
                child: ScrollConfiguration(
                  behavior: behavior,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (ResponsiveService.isMobile(context)) const SizedBox(width: 32),
                        AtomCategoryHeaderButton(
                          title: 'Legumes',
                          asset: 'assets/images/png/vegetables.png',
                          color: AppColors.darkEmerald,
                          onPressed: () {},
                          visible: isCategoriesVisible,
                        ),
                        const SizedBox(width: 32),
                        AtomCategoryHeaderButton(
                          title: 'Frutas',
                          asset: 'assets/images/png/fuits.png',
                          color: AppColors.limeGreen,
                          onPressed: () {},
                          visible: isCategoriesVisible,
                        ),
                        const SizedBox(width: 32),
                        AtomCategoryHeaderButton(
                          title: 'Temperos',
                          asset: 'assets/images/png/spice.png',
                          color: AppColors.peachPink,
                          onPressed: () {},
                          visible: isCategoriesVisible,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
