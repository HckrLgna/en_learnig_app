import 'package:avatar_glow/avatar_glow.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import '/../widgets/alert_dialog_widget.dart';
class PlacementTest extends StatefulWidget {
  const PlacementTest({super.key});

  @override
  State<PlacementTest> createState() => _PlacementTestState();
}

class _PlacementTestState extends State<PlacementTest> {
  final TextEditingController _textController = TextEditingController();
  final PageController _pageController = PageController();
  int _currentPage = 0;
  var loadingPercentage = 0;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  String _response = "";
  double _confidence = 1.0;
  late FlutterTts flutterTts;
  late ChatMessage botMessage;

  @override
  void initState() {
    _speech = stt.SpeechToText();
    super.initState();
    flutterTts = FlutterTts();
    botMessage = ChatMessage(
      text: "Hello, I'm CbaTalk, your personal English teacher. I will help you to improve your English skills. Let's start with a placement test. I will ask you some questions and you will answer them. Let's start!",
      name: "CbaTalk",
      type: false,
    );
    
  }
  void handleSubmitted(text) async {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      name: "User",
      type: true,
    );
    setState(() {
      botMessage = message;
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    _pageController.nextPage(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
    speak(text);
  }
  
  void speak(String message) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: 'Testment place')),
      body: Column(
        children: <Widget>[
          if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),

          const Padding(
            padding: EdgeInsets.all(10.0),
            child: TitleCustomize(
                data: "Start the test:",
                fontSize: 20,
                isBold: true,
                color: Color.fromRGBO(0, 102, 129, 1)),
          ),
          Container(
            height: 450,
            width: 350,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)),
            child: PageView.builder(
              controller: _pageController,
              itemCount: 5,
              onPageChanged: (int index) {
                setState(() {
                    _currentPage =
                    index; // Actualiza _currentPage cuando cambia la página
                  });
                },
                itemBuilder: (_, int index) {
                  return SizedBox(
                          height:MediaQuery.of(context).size.height * 0.40,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                            shadowColor: const Color.fromRGBO(
                                            123, 131, 133, 1),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: <Widget>[
                                  //todo: aqui iran las preguntas
                                  botMessage,
                                  TextField(
                              enabled: true,
                              controller: _textController,
                              onSubmitted: handleSubmitted,
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Listening"),
                            ),
                                ]
                            ),
                        ),
                  );
              }),   
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 204, 215, 218),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    print('exit');
                    showExitDialog(context);
                  },
                  child: const Text(
                    'Exit',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  )
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
                      _isListening ? Icons.mic_none_sharp : Icons.mic_off_sharp,
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
                margin: const EdgeInsets.only(top: 50),
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 102, 129, 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: TextButton(
                  onPressed: () async {
                    print('Enviando: $_text');
                    try {
                      //var res = await sendRequest(_text);
                      setState(() {
                        _response = "res['respuesta']";
                        print(_response);
                      });
                    } catch (e) {
                      print('Error: $e');
                    }
                  },
                  child: const Text(
                    'Send',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  )
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: ButtonNavigatorCustomize(),
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
