import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_cart_button.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_search_text_form_field.dart';
import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_user_menu.dart';
import 'package:flutter/material.dart';

import '../atom/atom_yandeh_logo.dart';

class MoleculeHeader extends StatelessWidget {
  final VoidCallback onPressed;
  final Function(String?) onFieldSubmitted;
  final VoidCallback onCartPressed;
  final String? storeName;
  final String? cnpjValue;
  const MoleculeHeader({
    super.key,
    required this.onPressed,
    required this.onCartPressed,
    this.storeName,
    this.cnpjValue,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AtomYandehLogo.colorful(),
          AtomSearchTextFormField(onFieldSubmitted: onFieldSubmitted),
          AtomUserMenu(onPressed: onPressed, cnpjValue: cnpjValue, storeName: storeName),
          const SizedBox(width: 16),
          AtomCartButton(onPressed: onCartPressed),
        ],
      ),
    );
  }
}
