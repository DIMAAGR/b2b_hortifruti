import 'package:b2b_hortifruti/modules/home/presentation/services/responsive_service.dart';
import 'package:b2b_hortifruti/modules/home/presentation/styles/atom_button_style.dart';
import 'package:b2b_hortifruti/shared/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class AtomBannerButton extends StatefulWidget {
  final VoidCallback onPressed;
  const AtomBannerButton({super.key, required this.onPressed});

  @override
  State<AtomBannerButton> createState() => _AtomBannerButtonState();
}

class _AtomBannerButtonState extends State<AtomBannerButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 40, end: 24).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onHover(bool isHovering) {
    if (isHovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.onPressed,
      onHover: _onHover,
      style: AtomButtonStyle.getOutlinedButtonStyle().copyWith(
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _animation.value),
        child: Text(
          'Ver mais',
          style: AppTextStyle.bannerButton.copyWith(
            fontSize: ResponsiveService.isMobile(context) ? 12 : 14,
          ),
        ),
      ),
    );
  }
}
