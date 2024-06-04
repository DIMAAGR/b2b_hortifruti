import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AtomYandehLogo extends StatelessWidget {
  final String _asset;
  final double? _height;
  final double? _width;

  const AtomYandehLogo._internal({
    required String asset,
    double? height,
    double? width,
  })  : _asset = asset,
        _height = height,
        _width = width;

  factory AtomYandehLogo.colorful() {
    return const AtomYandehLogo._internal(asset: 'assets/images/svg/yandeh_logo.svg');
  }
  factory AtomYandehLogo.white({
    double? height,
    double? width,
  }) {
    return AtomYandehLogo._internal(
      asset: 'assets/images/svg/yandeh_logo_white.svg',
      height: height,
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _asset,
      height: _height,
      width: _width,
    );
  }
}
