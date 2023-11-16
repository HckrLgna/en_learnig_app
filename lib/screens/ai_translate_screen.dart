import 'package:en_learn/services/chat_gpt_service.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class AiTranslateScreen extends StatefulWidget {
  const AiTranslateScreen({super.key});

  @override
  State<AiTranslateScreen> createState() => _AiTranslateScreenState();
}

class _AiTranslateScreenState extends State<AiTranslateScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'How': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
    ),
    'do': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
    ),
    'you': HighlightedWord(
      onTap: () => print('subscribe'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
    ),
    'say': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
    ),
    'What is': HighlightedWord(
      onTap: () => print('english'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
    ),
    'the meaning of': HighlightedWord(
      onTap: () => print('english'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
    ),
    'in english': HighlightedWord(
      onTap: () => print('english'),
      textStyle: const TextStyle(
          color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25),
    ),
  };

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  String _response = "";
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
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          color: Colors.white,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/ChatBoot.png'),
                radius: 35,
              ),
            ),
            Container(
              height: 110,
              width: 310,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Instructions:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: DefaultTextStyle(
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Agne',
                            color: Colors.black),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                                'You can say: How do you say ... in english?',
                                speed: const Duration(milliseconds: 200)),
                            TypewriterAnimatedText(
                                'You can say: What is the meaning of ... ?',
                                speed: const Duration(milliseconds: 200)),
                          ],
                          totalRepeatCount: 2,
                          pause: const Duration(milliseconds: 1000),
                        )),
                  ),
                ],
              ),
            ),
          ]),
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height - 305,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 0,
                width: 410,
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 0.7),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50, top: 20),
                            child: const Text("Query:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(68, 70, 84, 1))),
                          ),
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
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(68, 70, 84, 0.4)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: 410,
                child: Container(
                  height: 290,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50, top: 20),
                            child: const Text("Response: ",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(68, 70, 84, 1))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 150, top: 20),
                            child: IconButton(
                              onPressed: () {
                                debugPrint("se presiono el boton de sonido");
                                speak(_response);
                              },
                              icon: const Icon(Icons.volume_up_sharp),
                              color: const Color.fromRGBO(200, 200, 200, 1),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 160,
                        
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(_response,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(68, 70, 84, 0.4))),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 102, 129, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _text = "Press the button and start speaking";
                            _response = "";
                          });
                        },
                        icon: const Icon(Icons.replay_rounded),
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AvatarGlow(
                      animate: _isListening,
                      endRadius: 55,
                      glowColor: Colors.black26,
                      duration: const Duration(milliseconds: 2000),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.cyan[100],
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: IconButton(
                          onPressed: _listen,
                          icon: Icon(
                            _isListening
                                ? Icons.mic_none_sharp
                                : Icons.mic_off_sharp,
                            color: Colors.grey[800],
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 102, 129, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          print('Enviando: $_text');
                          try {
                            var res = await sendRequest(_text);
                            setState(() {
                              _response = res['respuesta'];
                              print(_response);
                            });
                          } catch (e) {
                            print('Error: $e');
                          }
                        },
                        icon: const Icon(Icons.send),
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
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
