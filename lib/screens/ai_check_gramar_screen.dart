import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class AiCheckGrammarScreen extends StatelessWidget {
  const AiCheckGrammarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
      Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), 
                border: Border.all(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  width: 1,
                ),
                color: const Color.fromRGBO(0, 102, 129, 1)),
            child: Column(
              children: [
               RowTitleSound(title: "Query", data: "texto vacio", color: Color.fromRGBO(212, 212, 214, 1), size: 20,),
               
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), 
                border: Border.all(
                  color: Color.fromRGBO(217, 217, 217, 1),
                  width: 1,
                ),
                color: Colors.white),
          ),
          AvatarGlow(
            animate: false,
            endRadius: 60,
            glowColor: const Color.fromRGBO(217, 217, 217, 0.6),
            duration: const Duration(milliseconds: 2000),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(68, 70, 84, 0.4),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(
                  Icons.mic_off_sharp,
                  color: Color.fromRGBO(68, 70, 84, 1),
                  size: 35,
                ),
              ),
            ),
          )
        ],
      ),
      Positioned(
        top: 230,
        child: CircleAvatar(
        radius: 50,
        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
        child: IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.replay_outlined,
            color: Color.fromRGBO(68, 70, 84, 1),
            size: 35,
          ),
        ),
      ))
    ]);
  }
}
