import 'package:flutter/material.dart';

class AiTranslateScreen extends StatelessWidget {
  const AiTranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.circle),
        const SizedBox(
          child: Text("Respuesta"),
        ),
        Container(
          height: 400,
          width: 200,
          color: Color.fromRGBO(68, 70, 84, 1),
          child: Text("data", style: TextStyle(color: Colors.white),),
        ),
        const SizedBox(
          child: Text("Ingrese la frase o palabra a interpreta"),
          
        )
      ],
    );
  }
}