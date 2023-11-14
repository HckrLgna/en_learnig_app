import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:highlight_text/highlight_text.dart';

class AiCheckGrammarScreen extends StatefulWidget {
  const AiCheckGrammarScreen({super.key});

  @override
  State<AiCheckGrammarScreen> createState() => _AiCheckGrammarScreenState();
}

class _AiCheckGrammarScreenState extends State<AiCheckGrammarScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'How': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'do': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'you': HighlightedWord(
      onTap: () => print('subscribe'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'say': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'in english': HighlightedWord(
      onTap: () => print('english'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  double _confidence = 1.0;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
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
                RowTitleSound(
                  title: "Query input:",
                  data: "texto vacio",
                  color: Color.fromRGBO(250, 250, 250, 1),
                  size: 18,
                  icon: Icons.delete,
                ),
                Container(
                  height: 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextHighlight(
                    text: _text,
                    words: _highlights,
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(227, 226, 226, 1)),
                  ),
                ),
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
                color: const Color.fromRGBO(255, 255, 255, 1)),
            child: Container(
              height: 100,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text("Mispelled Word:", style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Container(
                      height: 80,
                      child: const Text(
                        "It is a long established fact that a reader will be distracted by the readabledg  .",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(68, 70, 84, 1)),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: () {
                          debugPrint("primer icono");
                        }, icon: const Icon(Icons.copy)),
                        const SizedBox(width: 20,),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.share)),
                        const SizedBox(width: 20,),
                        IconButton(onPressed: (){}, icon: const Icon(Icons.volume_up_rounded))
                      ],
                    )
                  ],
                ),
              ),
            ),
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
                Icons.replay_circle_filled_outlined,
                color: Color.fromRGBO(68, 70, 84, 1),
                size: 35,
              ),
            ),
          ))
    ]);
  }
}
