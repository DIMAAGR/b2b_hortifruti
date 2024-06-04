import 'package:b2b_hortifruti/modules/home/presentation/controller/home_controller.dart';
import 'package:b2b_hortifruti/modules/home/presentation/services/responsive_service.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/organisms/organism_body.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/organisms/organism_header.dart';
import 'package:flutter/material.dart';

import '../domain/entities/store_data_entity.dart';

class HomePresentation extends StatelessWidget {
  final HomeController controller;
  const HomePresentation({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ResponsiveService.isMobile(context)
        ? _HomeMobilePresentation(controller)
        : _HomeMobilePresentation(controller);
  }
}

class _HomeWebPresentation extends StatelessWidget {
  final HomeController controller;
  const _HomeWebPresentation(this.controller);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class _HomeMobilePresentation extends StatefulWidget {
  final HomeController controller;
  const _HomeMobilePresentation(this.controller);

  @override
  State<_HomeMobilePresentation> createState() => _HomeMobilePresentationState();
}

class _HomeMobilePresentationState extends State<_HomeMobilePresentation> {
  @override
  void initState() {
    super.initState();

    widget.controller.getStoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(144),
        child: ListenableBuilder(
            listenable: Listenable.merge([widget.controller.category, widget.controller.storeData]),
            builder: (context, _) {
              StoreDataEntity? storeEntity = widget.controller.storeData.value?.data;

              return OrganismHeader(
                actualCategory: widget.controller.category.value,
                storeName: storeEntity?.storeName,
                cnpjValue: storeEntity?.cnpj,
                onCategoryPressed: (category) {
                  widget.controller.category.value = category;
                },
              );
            }),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ OrganismBody()],
        ),
      ),
    );
  }
}
