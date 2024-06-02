import 'package:b2b_hortifruti/modules/home/presentation/styles/atom_button_style.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AtomCategoryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final ButtonStyle _style;
  final TextStyle _textStyle;
  final Icon? icon;

  const AtomCategoryButton._internal({
    required this.title,
    required this.onPressed,
    required ButtonStyle style,
    required TextStyle textStyle,
    this.icon,
  })  : _style = style,
        _textStyle = textStyle;

  factory AtomCategoryButton.web({
    required String title,
    required VoidCallback? onPressed,
  }) {
    return AtomCategoryButton._internal(
      title: title,
      textStyle: AppTextStyle.categoryButton,
      onPressed: onPressed,
      style: AtomButtonStyle.getWebButtonStyle(),
    );
  }

  factory AtomCategoryButton.mobile({
    required String title,
    required VoidCallback? onPressed,
  }) {
    return AtomCategoryButton._internal(
      title: title,
      onPressed: onPressed,
      textStyle: AppTextStyle.categoryButton,
      style: AtomButtonStyle.getMobileButtonStyle(),
    );
  }

  factory AtomCategoryButton.bold({
    required String title,
    required VoidCallback? onPressed,
    required Icon icon,
  }) {
    return AtomCategoryButton._internal(
      icon: icon,
      title: title,
      onPressed: onPressed,
      textStyle: AppTextStyle.categoryButtonBold,
      style: AtomButtonStyle.getWebButtonStyle().copyWith(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(hoverColor: Colors.transparent),
      child: ElevatedButton(
        style: _style,
        onPressed: onPressed,
        child: Row(
          children: [
            if (icon != null) ...[icon!, const SizedBox(width: 8)],
            Text(title, style: _textStyle),
          ],
        ),
      ),
    );
  }
}
