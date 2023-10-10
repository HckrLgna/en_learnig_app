import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: 'Home')),
      body: Container(
         
      ),
       
    );
  }
}
