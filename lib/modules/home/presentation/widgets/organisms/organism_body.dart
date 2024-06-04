import 'package:flutter/material.dart';

import '../../../../../shared/presentation/consts/videos.dart';
import '../../../../../shared/presentation/theme/colors.dart';
import '../molecules/molecule_category_banner.dart';
import '../molecules/molecule_favorites_banner.dart';

class OrganismBody extends StatelessWidget {
  const OrganismBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MoleculeCategoryBanner(isCategoriesVisible: true),
        MoleculeFavoritesBanner(
          backgroundColor: AppColors.brightRed,
          backgroundTitleColor: AppColors.orangeAccent,
          onSeeMorePressed: () {},
          subtitle: 'Veja os produtos mais queridos pelos nossos clientes.',
          title: 'Queridinhos!',
          videoAsset: VideosPath.fruitsBanner,
        ),
        MoleculeFavoritesBanner(
          backgroundColor: AppColors.mossGreen,
          backgroundTitleColor: AppColors.lime,
          onSeeMorePressed: () {},
          subtitle: 'Veja opções fresquinhas para abastecer seu hortifruti.',
          title: 'Hortifruti Perfeito!',
          videoAsset: VideosPath.vegetablesBanner,
        ),
      ],
    );
  }
}
