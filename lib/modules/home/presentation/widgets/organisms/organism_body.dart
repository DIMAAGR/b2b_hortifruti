import 'package:b2b_hortifruti/modules/home/domain/entities/market_data_entity.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/molecules/molecule_section.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/presentation/consts/videos.dart';
import '../../../../../shared/presentation/theme/colors.dart';
import '../molecules/molecule_category_banner.dart';
import '../molecules/molecule_favorites_banner.dart';

class OrganismBody extends StatelessWidget {
  final MarketDataEntity? marketData;
  const OrganismBody({super.key, this.marketData});

  @override
  Widget build(BuildContext context) {
    return marketData != null && marketData?.isSectionsEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Text(
                'Ops! Não conseguimos encontrar o que você estava procurando.',
                style: AppTextStyle.errorMessage,
              ),
            ),
          )
        : Column(
            children: [
              const SizedBox(height: 32),
              const MoleculeCategoryBanner(isCategoriesVisible: true),
              const SizedBox(height: 32),
              if (_sectionExists(0))
                MoleculeSection(
                  backgroundColor: AppColors.darkEmerald,
                  onSeeMorePressed: () {},
                  section: marketData?.sections?[0],
                ),
              if (_sectionExists(1))
                MoleculeSection(
                  backgroundColor: AppColors.brightRed,
                  onSeeMorePressed: () {},
                  section: marketData?.sections?[1],
                ),
              MoleculeFavoritesBanner(
                backgroundColor: AppColors.brightRed,
                backgroundTitleColor: AppColors.orangeAccent,
                onSeeMorePressed: () {},
                subtitle: 'Veja os produtos mais queridos pelos nossos clientes.',
                title: 'Queridinhos!',
                videoAsset: VideosPath.fruitsBanner,
              ),
              const SizedBox(height: 32),
              if (_sectionExists(2))
                MoleculeSection(
                  backgroundColor: AppColors.jadeite,
                  onSeeMorePressed: () {},
                  section: marketData?.sections?[2],
                ),
              if (_sectionExists(3))
                MoleculeSection(
                  backgroundColor: AppColors.lime,
                  onSeeMorePressed: () {},
                  section: marketData?.sections?[3],
                 
                ),
              MoleculeFavoritesBanner(
                backgroundColor: AppColors.mossGreen,
                backgroundTitleColor: AppColors.lime,
                onSeeMorePressed: () {},
                subtitle: 'Veja opções fresquinhas para abastecer seu hortifruti.',
                title: 'Hortifruti Perfeito!',
                videoAsset: VideosPath.vegetablesBanner,
              ),
              const SizedBox(height: 32),
              if (_sectionExists(4))
                MoleculeSection(
                  backgroundColor: AppColors.darkEmerald,
                  onSeeMorePressed: () {},
                  section: marketData?.sections?[4],
                ),
              if (_sectionExists(5))
                MoleculeSection(
                  backgroundColor: AppColors.peachPink,
                  onSeeMorePressed: () {},
                  section: marketData?.sections?[5],
                ),
            ],
          );
  }

  bool _sectionExists(int index) {
    return marketData == null ||
        marketData?.sections != null && marketData!.sections!.length > index;
  }
}
