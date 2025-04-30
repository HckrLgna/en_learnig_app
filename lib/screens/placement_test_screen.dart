import 'package:avatar_glow/avatar_glow.dart';
import 'package:en_learn/providers/backend.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
  var loadingPercentage = 0;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '  _Press the button and start speaking';

  // String _response = "";
  double _confidence = 1.0;
  late FlutterTts flutterTts;
  late ChatMessage botMessage;
  late BackendProvider backendService;
  // var preguntaIni;

  @override
  void initState() {
    _speech = stt.SpeechToText();
    super.initState();
    flutterTts = FlutterTts();
    backendService =  Provider.of<BackendProvider>(context,listen: false);
    debugPrint(backendService.preguntaActual);
      botMessage = const ChatMessage(
        text: "Iniciando",
        name: "CbaTalk",
        type: false,
      );
    Future.delayed(const Duration(milliseconds: 5000), () {
      ChatMessage message = ChatMessage(
        text: backendService.preguntaActual,
        name: "CbaTalk",
        type: false,
      );
      setState(() {
        botMessage = message;
      });
    });
  
  }

  void handleSubmitted(text) async {
    //_textController.clear();
    Future.delayed(const Duration(milliseconds: 3000), () {
      ChatMessage message = ChatMessage(
        text: text,
        name: "CBATalk",
        type: false,
      );
      setState(() {
        botMessage = message;
      });
    });
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
                data: "Start the test",
                fontSize: 20,
                isBold: true,
                color: Color.fromRGBO(0, 102, 129, 1)),
          ),
                SizedBox(  
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    shadowColor: const Color.fromRGBO(123, 131, 133, 1),
                    clipBehavior: Clip.antiAlias,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(children: <Widget>[
                        //todo: aqui iran las preguntas
                        botMessage,
                        const SizedBox(height: 40.0),
                        TextField(
                          maxLines: 6,
                          enabled: true,
                          controller: _textController,
                          onSubmitted: handleSubmitted,
                          decoration: InputDecoration.collapsed(
                              
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              fillColor: Colors.white,
                              filled: true,    
                              hintText: _text),
                        ),
                      ]),
                    ),
                  ),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 204, 215, 218),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      debugPrint('exit');
                      showExitDialog(context, "Exit", "Are you sure?", true);
                    },
                    child: const Text(
                      'Exit',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
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
                      debugPrint('Enviando: $_text');
                      try {
                          var respuestaBack = await backendService.pruebaSiguiente(_text);
                          debugPrint( "respuesta back ${respuestaBack.toString()}");
                        if( respuestaBack == "Prueba finalizada" ){
                          if (!context.mounted) return;
                          showExitDialog(context, "Prueba finalizada", "Su nivel es: ${backendService.resModulo}", false);
                        }else{
                          handleSubmitted(respuestaBack);
                        }
                      } catch (e) {
                        debugPrint('Error: $e');
                      }
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ],
      ),
      // bottomNavigationBar: const ButtonNavigatorCustomize(),
    );
  }

  void _listen() async {
    debugPrint("listen");
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => debugPrint('onStatus: $val'),
        onError: (val) => debugPrint('onError: $val'),
      );
      debugPrint(available.toString());
      if (available) {
        setState(() {
          _isListening = true;
          _text = '';
        });
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
