import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_product_card.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_product_section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/market_data_entity.dart';

class MoleculeSection extends StatefulWidget {
  final Color backgroundColor;
  final VoidCallback onSeeMorePressed;
  final Sections? section;

  const MoleculeSection({
    super.key,
    required this.backgroundColor,
    required this.onSeeMorePressed,
    required this.section,
  });

  @override
  _MoleculeSectionState createState() => _MoleculeSectionState();
}

class _MoleculeSectionState extends State<MoleculeSection> {
  final ScrollController _scrollController = ScrollController();
  List<Products> _displayedProducts = [];
  int _currentMax = 16;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _initializeProducts() {
    if (widget.section != null && widget.section!.products != null) {
      setState(() {
        _displayedProducts = widget.section!.products!.take(_currentMax).toList();
      });
    }
  }

  void _scrollListener() {
    if(widget.section != null) {
    if (_scrollController.position.extentAfter < 500 && _currentMax != widget.section!.products!.length) {
      setState(() {
        _currentMax = (_currentMax + 16).clamp(0, widget.section!.products!.length);
        _displayedProducts = widget.section!.products!.take(_currentMax).toList();
      });
    }}
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScrollBehavior behavior = const ScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    );

    if(widget.section != null && _displayedProducts.length == 0) {
      _initializeProducts();
    }

    return Visibility(
      visible: widget.section == null || widget.section!.products!.isNotEmpty,
      child: Container(
        height: 408,
        padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 32.0),
        child: Stack(
          children: [
            AtomProductSection(
              backgroundColor: widget.backgroundColor,
              onSeeMorePressed: widget.onSeeMorePressed,
              subtitle: widget.section?.description,
              title: widget.section?.section,
              visible: widget.section != null,
            ),
            Positioned(
              bottom: 1,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 64,
                child: ScrollConfiguration(
                  behavior: behavior,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                      child: Row(
                        children: _buildProductsCard(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildProductsCard() {
    return widget.section == null
        ? List.generate(16, (_) => const AtomProductCard())
        : _displayedProducts.map((product) => AtomProductCard(product: product)).toList();
  }
}