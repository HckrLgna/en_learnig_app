import 'package:flutter/material.dart';

class AiTranslateScreen extends StatelessWidget {
  const AiTranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         Container(
          height: 100,
          color: Colors.grey,
         ),
         Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                height: 300,
                width: 300,
                color: Color.fromARGB(255, 177, 105, 105),
              ),
              Positioned(
                
                bottom: 20,
                child: Container(
                  height: 200,
                  width: 200,
                  color: Color.fromARGB(255, 223, 8, 8),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  height: 100,
                  width: 100,
                  color: Color.fromARGB(255, 30, 163, 108),
                ),
              ),
            ],
            
         )
      ],
    );
  }
}