import 'package:b2b_hortifruti/modules/home/presentation/widgets/atom/atom_category_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomePresentation extends StatelessWidget {
  const HomePresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width <= 700 || !kIsWeb
        ? const _HomeMobilePresentation()
        : const _HomeWebPresentation();
  }
}

class _HomeWebPresentation extends StatelessWidget {
  const _HomeWebPresentation();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

class _HomeMobilePresentation extends StatelessWidget {
  const _HomeMobilePresentation();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AtomButton.web(
            title: 'ainh',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
