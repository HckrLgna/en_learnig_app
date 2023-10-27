import 'package:en_learn/screens/ai_translate_screen.dart';
import 'package:en_learn/screens/screens.dart';
import 'package:en_learn/widgets/option_menu.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';


class AiToolsScreen extends StatelessWidget {
  final Widget screen;
  const AiToolsScreen({super.key, required this.screen});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: "Explore")),
      body: screen,
    );
  }
}

