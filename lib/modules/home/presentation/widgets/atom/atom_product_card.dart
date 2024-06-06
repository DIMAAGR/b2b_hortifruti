import 'dart:math';

import 'package:b2b_hortifruti/modules/home/domain/entities/market_data_entity.dart';
import 'package:b2b_hortifruti/modules/home/presentation/extensions/box_decoration.dart';
import 'package:b2b_hortifruti/modules/home/presentation/styles/atom_shadow_style.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/colors.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AtomProductCard extends StatelessWidget {
  final Products? product;
  final Function(Products?)? onAddPressed;
  const AtomProductCard({super.key, this.product, this.onAddPressed});

  final double cardHeight = 280;
  final double cardWidth = 144;

  @override
  Widget build(BuildContext context) {
    final String photo = _getRandomPhoto();
    final String content = _getContent();
    final String weight = _getWeight();

    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: Colors.white,
    );

    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Container(
        height: cardHeight,
        width: cardWidth,
        decoration: decoration.withBoxShadow(AtomShadowStyle.productCard),
        child: product == null
            ? Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  height: cardHeight,
                  width: cardWidth,
                  decoration: decoration,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: SizedBox(
                      width: 120,
                      child: Stack(
                        children: [
                          Image.asset(photo),
                          Positioned(
                            top: 1,
                            right: 1,
                            child: Container(
                              margin: EdgeInsets.only(top: 8.0, right: 0.0),
                              decoration:
                                  BoxDecoration(shape: BoxShape.circle, color: AppColors.orange),
                              child: InkWell(
                                onTap: onAddPressed != null ? () => onAddPressed!(product) : null,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.add,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'R\$ ${product!.price} ${product?.unitType?.toLowerCase() ?? ''}',
                          style: AppTextStyle.productPrice,
                        ),
                        const SizedBox(height: 2),
                        SizedBox(
                          width: 100,
                          child: Text(
                            product!.name ?? '',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.productCartYandeh
                                .copyWith(color: AppColors.midnightBlue),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.babyBlue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
                            child: Text(
                              weight,
                              style: AppTextStyle.productCartYandeh
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(product!.ean ?? '', style: AppTextStyle.productCartYandeh),
                      ],
                    ),
                  ),
                  Center(child: Text(content, style: AppTextStyle.boxContent)),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text('Yandeh', style: AppTextStyle.productCartYandeh),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  String _getRandomPhoto() {
    const photos = [
      'assets/images/png/product-01.png',
      'assets/images/png/product-02.png',
    ];
    return photos[Random().nextInt(photos.length)];
  }

  String _getContent() {
    if (product == null || product?.unitContent == null) return '';

    final packageContentMap = {
      'CAIXA':
          'Caixa c/ ${(product!.unitContent ?? 0 * (product!.packageQuantity ?? 0)).toStringAsFixed(0).replaceAll('.', ',')} kg',
      'UNIDADE':
          '${product!.packageQuantity ?? 0} ${(product!.packageQuantity ?? 0) <= 1 ? 'unidade' : 'unidades'}',
      'BANDEJA':
          '${product!.packageQuantity ?? 0} ${(product!.packageQuantity ?? 0) <= 1 ? 'bandeja' : 'bandejas'}',
    };
    return packageContentMap[product!.package ?? ''] ?? '';
  }

  String _getWeight() {
    if (product == null) return '';
    final weightMap = {
      'KG': '${product!.unitContent ?? 0} quilograma',
      'G': 'bandeja ${product!.unitContent ?? 0}g',
    };
    return weightMap[product!.unitMessure ?? ''] ?? '';
  }
}
