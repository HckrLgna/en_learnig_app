import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';


class AiToolsScreen extends StatelessWidget {
  const AiToolsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: "Explore")),
      body: Container(
        color: Colors.amber,
        
      ),
    );
  }
}

