import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.arrow_back_ios, color: Color.fromRGBO(0, 102, 129, 1), weight: 10),
          ),
        title: Text("Home", style: TextStyle( color: Color.fromRGBO(33, 33, 33, 0.8), fontSize: 20, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
      ),
    );
  }
}
