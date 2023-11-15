import 'package:en_learn/services/notifications_service.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../services/chat_gpt_service.dart';

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
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  String _response = '';
  double _confidence = 1.0;
  late FlutterTts flutterTts;

  @override
  void initState() {
    _speech = stt.SpeechToText();
    super.initState();
    flutterTts = FlutterTts();
  }

  void speak(String message) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(message);
  }

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
                  color: const Color.fromRGBO(217, 217, 217, 1),
                  width: 1,
                ),
                color: const Color.fromRGBO(0, 102, 129, 1)),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 50, top: 20),
                      child: const Text("Query Input",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 120, top: 20),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _text = 'Press the button and start speaking';
                            _response = '';
                          });
                        },
                        icon: const Icon(Icons.delete),
                        color: const Color.fromRGBO(200, 200, 200, 1),
                      ),
                    )
                  ],
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
                  color: const Color.fromRGBO(217, 217, 217, 1),
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
                    const Text(
                      "Mispelled Word:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 80,
                      child: Text(
                        _response,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(68, 70, 84, 1)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              NotificationsService.showSnackBar(
                                  "Copied to clipboard");
                            },
                            icon: const Icon(Icons.copy)),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.share)),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              speak(_response);
                            },
                            icon: const Icon(Icons.volume_up_rounded))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          AvatarGlow(
            animate: _isListening,
            endRadius: 50,
            glowColor: Colors.black,
            duration: const Duration(milliseconds: 2000),
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Color.fromRGBO(159, 218, 218,1),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                onPressed: _listen,
                icon: Icon(
                  _isListening ? Icons.mic_none_sharp : Icons.mic_off_sharp,
                  color: Colors.black,
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
            backgroundColor: const Color.fromRGBO(217, 217, 217, 1),
            child: IconButton(
              onPressed: () async {
                print('Enviando: $_text');
                try {
                  var res = await sendRequest("Correct this please: $_text");
                  setState(() {
                    _response = res['respuesta'];
                  });
                } catch (e) {
                  print('Error: $e');
                }
              },
              icon: const Icon(
                Icons.replay_circle_filled_outlined,
                color: Color.fromRGBO(68, 70, 84, 1),
                size: 35,
              ),
            ),
          ))
    ]);
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
