import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

import '../../styles/atom_button_style.dart';

class AtomCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AtomCartButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: AtomButtonStyle.getOrangeButtonStyle(),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 20),
            SizedBox(width: 8),
            Text('Carrinho', style: AppTextStyle.cart),
          ],
        ),
      ),
    );
  }
}
