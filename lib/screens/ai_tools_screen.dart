 
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';


class AiToolsScreen extends StatelessWidget {
  final Widget screen;
  final String title;
  const AiToolsScreen({super.key, required this.screen, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarCustomize(title: title)),
      body: screen,
    );
  }
}

