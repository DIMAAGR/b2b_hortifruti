import 'package:b2b_hortifruti/modules/home/presentation/controller/home_controller.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/organisms/organism_body.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/organisms/organism_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../domain/entities/store_data_entity.dart';

class HomePresentation extends StatefulWidget {
  final HomeController controller;
  final String? search;
  const HomePresentation({super.key, required this.controller, this.search});

  @override
  State<HomePresentation> createState() => _HomePresentationState();
}

class _HomePresentationState extends State<HomePresentation> {
  @override
  void initState() {
    super.initState();
    if (widget.controller.userData.value == null) {
      widget.controller.getUserStoreData();
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.getMarketData(widget.search);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(144),
        child: ListenableBuilder(
            listenable: Listenable.merge([widget.controller.category, widget.controller.userData]),
            builder: (context, _) {
              StoreDataEntity? storeEntity = widget.controller.userData.value?.data;

              return OrganismHeader(
                onFieldSubmitted: (text) {
                  if (text != '') {
                    String searcherData = '?search=${Uri.encodeComponent(text!)}';
                    Modular.to.pushNamed('${Modular.initialRoute}$searcherData');
                  }
                },
                actualCategory: widget.controller.category.value,
                storeName: storeEntity?.storeName,
                cnpjValue: storeEntity?.cnpj,
                onCategoryPressed: (category) {
                  widget.controller.category.value = category;
                },
              );
            }),
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder(
            valueListenable: widget.controller.marketData,
            builder: (context, marketData, _) {
              return OrganismBody(
                marketData: marketData?.data,
              );
            }),
      ),
    );
  }
}
