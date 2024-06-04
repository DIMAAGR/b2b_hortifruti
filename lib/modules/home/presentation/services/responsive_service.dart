import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

abstract class ResponsiveService {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 850 || !kIsWeb;
  }
}
