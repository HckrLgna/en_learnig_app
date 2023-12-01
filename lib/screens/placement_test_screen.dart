import 'package:avatar_glow/avatar_glow.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';

class PlacementTest extends StatefulWidget {
  const PlacementTest({super.key});

  @override
  State<PlacementTest> createState() => _PlacementTestState();
}

class _PlacementTestState extends State<PlacementTest> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  var loadingPercentage = 0;
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
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.40,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        shadowColor: const Color.fromRGBO(
                                            123, 131, 133, 1),
                                        clipBehavior: Clip.antiAlias,
                                        child: Column(
                                          children: <Widget>[
                                            const SizedBox(width: 5),
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 30, bottom: 5),
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      
                                                      "data[index]['title']",
                                                      textAlign: TextAlign.center,
                                                        style: const TextStyle(
                                                            
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Color.fromRGBO(
                                                                    4,
                                                                    76,
                                                                    132,
                                                                    1),
                                                            fontSize: 20)),
                                                    const SizedBox(height: 3),
                                                    SizedBox(
                                                      child: Text(
                                                          "data[index]['area']",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .grey[600])),
                                                    ),
                                                  ],
                                                )),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 35),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.19,
                                              child: SingleChildScrollView(
                                                child: Text("data[index]['smg']",
                                                    textAlign:
                                                        TextAlign.justify),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 5, top: 10.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                   
                                                },
                                                child: Text(
                                                  "data[index]['titulo_url']",
                                                  style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .underline,
                                                      color: Colors.blue),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  right: 25),
                                              alignment: Alignment.centerRight,
                                              child: OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Leido')),
                                            )
                                          ],
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
                  color: const Color.fromRGBO(0, 102, 129, 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    print("se presiono el boton exit");
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
