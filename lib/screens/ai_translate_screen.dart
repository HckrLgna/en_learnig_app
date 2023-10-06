import 'package:flutter/material.dart';

class AiTranslateScreen extends StatelessWidget {
  const AiTranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.circle),
        SizedBox(
          child: Text("Respuesta"),
        ),
        Container(
          height: 400,
          width: 200,
          color: Color.fromRGBO(68, 70, 84, 1),
          child: Text("data", style: TextStyle(color: Colors.white),),
        ),
        SizedBox(
          child: Text("Ingrese la frase o palabra a interpreta"),
          
        )
      ],
    );
  }
}