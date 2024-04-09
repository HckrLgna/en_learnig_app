import 'package:flutter/material.dart';

class AppBarCustomize extends StatelessWidget {
  const AppBarCustomize({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
            Navigator.pop(context);
            debugPrint("vuelta");
          }, 
          icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(0, 102, 129, 1), weight: 10),
          ),
        title: Text(title, style: const TextStyle( color: Color.fromRGBO(33, 33, 33, 0.8), fontSize: 20, fontWeight: FontWeight.bold),),
        elevation: 0,
        centerTitle: true,
      );
  }
}