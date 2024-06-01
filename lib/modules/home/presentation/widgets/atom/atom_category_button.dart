import 'package:b2b_hortifruti/modules/home/presentation/widgets/styles/atom_button_style.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AtomButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final ButtonStyle _style;

  const AtomButton._internal({
    required this.title,
    required this.onPressed,
    required ButtonStyle style,
  }) : _style = style;

  factory AtomButton.web({required String title, required VoidCallback? onPressed}) {
    return AtomButton._internal(
      title: title,
      onPressed: onPressed,
      style: AtomButtonStyle.getWebButtonStyle(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(hoverColor: Colors.transparent),
      child: ElevatedButton(
        style: _style,
        onPressed: () {},
        child: Text(title, style: AppTextStyle.categoryButton),
      ),
    );
  }
}
